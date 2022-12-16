terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-state"
    key            = "eks-remote-state"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-lock-state"
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

