variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "ap-southeast-1"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type        = string
  default     = "terraform-key"
}

variable "aws_profile" {
  description = "AWS Profile Credentials"
  type        = string
  default     = "my-profile"
}

