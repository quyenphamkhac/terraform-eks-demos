terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  profile = "my-profile"
  region  = "ap-southeast-1"
}

resource "aws_instance" "ec2demo" {
  ami           = "ami-094bbd9e922dc515d"
  instance_type = "t2.micro"
}
