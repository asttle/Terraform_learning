
resource "aws_security_group" "ec2_sg" {
    name        = "ec2-security-group"
    description = "Security group for EC2 instances"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = local.http_port
        to_port     = local.http_port
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "elb_sg" {
    name        = "elb-security-group"
    description = "Security group for ELB"

    ingress {
        from_port   = local.http_port
        to_port     = local.http_port
        protocol    = "tcp"
        security_groups = [aws_security_group.ec2_sg.id]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        security_groups = [aws_security_group.ec2_sg.id]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

locals {
  http_port = 80
}

output "sg_id" {
    value = aws_security_group.ec2_sg.id
}