output "security_group_id" {
  description = "The ID of the created security group"
  value       = aws_security_group.web_sg.id
}

output "private_security_group_id" {
  value = aws_security_group.private_sg.id
}
