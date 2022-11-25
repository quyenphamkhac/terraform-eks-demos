locals {
  owners           = var.business_division
  environment      = var.environment
  name             = "${var.business_division}-${var.environment}"
  eks_cluster_name = "${local.name}-${var.cluster_name}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "amzlinux2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

module "public_bastion_host_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.16"

  name                = "${local.name}-public-bastion-host-sg"
  description         = "Security Group with SSH port open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id              = module.vpc.vpc_id
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
  tags                = local.common_tags
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 4.0"

  name = "${local.name}-BastionHost"

  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  # monitoring             = true
  vpc_security_group_ids = [module.public_bastion_host_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = local.common_tags
}

resource "aws_eip" "bastion_eip" {
  depends_on = [module.ec2_instance, module.vpc]
  instance   = module.ec2_instance.id
  vpc        = true
  tags       = local.common_tags
}

# resource "null_resource" "copy_ec2_keys" {
#   connection {
#     type        = "ssh"
#     host        = aws_eip.bastion_eip.public_ip
#     user        = "ec2-user"
#     password    = ""
#     private_key = file("keys/terraform-key.pem")
#   }

#   provisioner "file" {
#     source      = "config/config.yml"
#     destination = "/tmp/config.yml"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo chmod 400 /tmp/config.yml"
#     ]
#   }

#   provisioner "local-exec" {
#     command     = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> vpc-created-time.txt"
#     working_dir = ""
#   }
# }

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  version = "~> 3.18"

  # VPC Basic Details
  name            = var.vpc_name
  cidr            = var.vpc_cidr_block
  azs             = data.aws_availability_zones.available.zone_ids
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  # Database Subnets
  database_subnets                   = var.vpc_database_subnets
  create_database_subnet_group       = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table

  # NAT Gateways
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true


  vpc_tags = local.common_tags
  tags     = local.common_tags

  public_subnet_tags = {
    Type                                              = "public-subnets"
    "kubernetes.io/role/elb"                          = 1
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }

  private_subnet_tags = {
    Type                                              = "private-subnets"
    "kubernetes.io/role/internal-elb"                 = 1
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }
}
