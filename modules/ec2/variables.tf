variable "ami_id" {
  description = "AMI ID to launch instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "subnet_ids" {
  description = "List of subnet IDs to place EC2s in"
  type        = list(string)
}

variable "webserver_names" {
  description = "List of names for webservers"
  type        = list(string)
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to associate with EC2s"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}
