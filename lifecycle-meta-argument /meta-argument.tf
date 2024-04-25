provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "lifecycle_meta_argument" {
  ami = "ami-0c618421e207909d0"
  instance_type = "t2.micro"
  tags = {
    Name = "Hello, World!"
  }
  lifecycle {
    ignore_changes = [ tags ]
  }
}


