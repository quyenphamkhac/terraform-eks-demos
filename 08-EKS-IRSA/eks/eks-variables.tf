variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = "eksdemo"
}

variable "cluster_service_ipv4_cidr" {
  description = "service ipv4 cidr for the kubernetes cluster"
  type        = string
  default     = null
}

variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster (for example 1.21)"
  type        = string
  default     = null
}
variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`."
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}


variable "eks_nodegroup_ami_type" {
  description = "EKS node group ami type"
  type        = string
  default     = "AL2_x86_64"
}

variable "eks_nodegroup_capacity_type" {
  description = "EKS node group capacity type"
  type        = string
  default     = "ON_DEMAND"
}

variable "eks_nodegroup_instance_types" {
  description = "EKS node group instance types"
  type        = list(string)
  default     = ["t3.micro"]
}

variable "eks_nodegroup_disk_size" {
  description = "EKS node group disk size"
  type        = number
  default     = 20
}

variable "eks_nodegroup_ssh_key" {
  description = "EKS node group ssh key"
  type        = string
  default     = "terraform-key"
}

variable "eks_nodegroup_desired_size" {
  description = "EKS node group scaling group desired size"
  type        = number
  default     = 1
}

variable "eks_nodegroup_min_size" {
  description = "EKS node group scaling group min size"
  type        = number
  default     = 1
}

variable "eks_nodegroup_max_size" {
  description = "EKS node group scaling group max size"
  type        = number
  default     = 2
}

variable "eks_nodegroup_max_unavailable" {
  description = "EKS node group max unavailable"
  type        = number
  default     = 1
}
