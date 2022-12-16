data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket  = "terraform-eks-1996"
    key     = "dev/eks-cluster/terraform.tfstate"
    region  = var.aws_region
    profile = var.aws_profile
  }
}
