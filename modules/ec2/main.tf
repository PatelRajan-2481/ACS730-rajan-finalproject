resource "aws_instance" "webservers" {
  count         = length(var.webserver_names)
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, count.index)
  key_name      = var.key_name

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "${var.name_prefix}-${var.webserver_names[count.index]}"
  }
}
