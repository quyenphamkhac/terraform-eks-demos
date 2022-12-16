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

variable "terraform_dynamodb_table" {
  description = "Dynamo DB Table which use for terraform state locking"
  type        = string
  default     = "Terraform"
}

variable "terraform_s3_bucket" {
  description = "S3 Bucket which use to store terraform state files"
  type        = string
  default     = "terraform-s3"
}

variable "terraform_s3_key" {
  description = "Sub folder to store terraform state files"
  type        = string
  default     = "my-project"
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
