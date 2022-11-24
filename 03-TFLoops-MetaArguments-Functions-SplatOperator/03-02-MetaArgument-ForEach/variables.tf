variable "instance_type_list" {
  type        = list(string)
  description = "EC2 Instance Type List"
  default     = ["t3.micro", "t3.small"]
}

variable "instance_type_map" {
  type        = map(string)
  description = "EC2 Instance Type Map"
  default = {
    "dev"  = "t3.micro"
    "qa"   = "t3.small"
    "prod" = "t3.large"
  }
}

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

