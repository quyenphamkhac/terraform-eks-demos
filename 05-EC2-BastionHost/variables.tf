# Generic Variables
variable "aws_profile" {
  description = "AWS Profile Credentials"
  type        = string
  default     = "my-profile"
}

variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "ap-southeast-1"
}

variable "environment" {
  description = "Enviroment where AWS resources will be created"
  type        = string
  default     = "dev"
}

variable "business_division" {
  description = "Business Division in the large organization"
  type        = string
  default     = "SAP"
}

# AWS EC2 Instance Terraform Variables

# AWS EC2 Instance Type
variable "instance_type" {
  type        = string
  description = "EC2 Bastion Host Instance Type"
  default     = "t3.micro"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  type        = string
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  default     = "terraform-key"
}

# VPC Input Variables
# VPC Name
variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "myvpc"
}

# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

# VPC Availability Zones
# variable "vpc_availability_zones" {
#   description = "VPC Availability Zones"
#   type        = list(string)
#   default     = ["us-east-1a", "us-east-1b"]
# }

# VPC Public Subnets
variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# VPC Database Subnets
variable "vpc_database_subnets" {
  description = "VPC Database Subnets"
  type        = list(string)
  default     = ["10.0.151.0/24", "10.0.152.0/24"]
}

# VPC Create Database Subnet Group (True / False)
variable "vpc_create_database_subnet_group" {
  description = "VPC Create Database Subnet Group"
  type        = bool
  default     = true
}

# VPC Create Database Subnet Route Table (True or False)
variable "vpc_create_database_subnet_route_table" {
  description = "VPC Create Database Subnet Route Table"
  type        = bool
  default     = true
}


# VPC Enable NAT Gateway (True or False) 
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT Gateways for Private Subnets Outbound Communication"
  type        = bool
  default     = true
}

# VPC Single NAT Gateway (True or False)
variable "vpc_single_nat_gateway" {
  description = "Enable only single NAT Gateway in one Availability Zone to save costs during our demos"
  type        = bool
  default     = true
}

# EKS Cluster Input Variables
variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = "eksdemo"
}
