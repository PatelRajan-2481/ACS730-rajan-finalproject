output "instance_ids" {
  description = "IDs of all EC2 instances"
  value       = [for instance in aws_instance.webservers : instance.id]
}

output "public_ips" {
  description = "Public IPs of EC2 instances"
  value       = [for instance in aws_instance.webservers : instance.public_ip]
}

output "private_ips" {
  description = "Private IPs of EC2 instances"
  value       = [for instance in aws_instance.webservers : instance.private_ip]
}
