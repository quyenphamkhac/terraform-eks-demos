terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-eks-1996"
    key            = "eks-cluster-demo"
    region         = "ap-southeast-1"
    profile        = "my-profile"
    dynamodb_table = "Terraform"
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

