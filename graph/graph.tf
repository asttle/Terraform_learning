provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "graph" {
  ami = "ami-0c618421e207909d0"
  instance_type = "t2.micro"
  tags = {
    Name = "graph-ec2"
  }
}

resource "aws_eip" "graph_eip" {
    instance = aws_instance.graph.id
    vpc = true
}

resource "aws_security_group" "allow_tls" {
    ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["${aws_eip.graph_eip.private_ip}/32"]
}
}

