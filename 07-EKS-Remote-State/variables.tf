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
