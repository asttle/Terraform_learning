locals {
  splunk = "8089"
}

resource "aws_security_group" "security_group_payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example]
  tags = {
    Name = "payment_app"
  }

  # Below ingress allows HTTPS  from DEV VPC
  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = var.protocol
    cidr_blocks = [var.dev_vpc_cidr]
  }

  # Below ingress allows APIs access from DEV VPC

  ingress {
    from_port   = var.dev_vpc_port
    to_port     = var.dev_vpc_port
    protocol    = var.protocol
    cidr_blocks = [var.dev_vpc_cidr]
  }

  # Below ingress allows APIs access from Prod App Public IP.

  ingress {
    from_port   = var.prod_app_port
    to_port     = var.prod_app_port
    protocol    = var.protocol
    cidr_blocks = ["${aws_eip.example.public_ip}/32"]
  }
  egress {
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = var.protocol
    cidr_blocks = ["0.0.0.0/0"]
  }
}