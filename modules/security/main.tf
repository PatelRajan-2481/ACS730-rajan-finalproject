resource "aws_security_group" "web_sg" {
  name        = "${var.name_prefix}-WebSG"
  description = "Allow SSH and HTTP"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-WebSG"
  }
}

resource "aws_security_group" "private_sg" {
  name        = "${var.name_prefix}-PrivateSG"
  description = "Allow SSH only from Bastion"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from Bastion subnet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  # Bastion subnet CIDR
    cidr_blocks = ["10.1.2.0/24"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-PrivateSG"
  }
}
