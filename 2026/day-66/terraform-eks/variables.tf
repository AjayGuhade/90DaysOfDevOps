variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "terraweek-eks"
}

variable "cluster_version" {
  description = "EKS version"
  type        = string
  default     = "1.31"
}

variable "node_instance_type" {
  description = "Worker node instance type"
  type        = string
  default     = "t3.medium"
}

variable "node_desired_count" {
  description = "Desired node count"
  type        = number
  default     = 2
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}