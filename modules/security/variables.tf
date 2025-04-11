variable "vpc_id" {
  description = "The VPC ID for the security group"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH (your IP or 0.0.0.0/0)"
  type        = string
}
