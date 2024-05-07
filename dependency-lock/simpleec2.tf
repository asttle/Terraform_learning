terraform {
    required_providers {
        aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
        }
    }
}


provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "myec2" {
  ami = "ami-019a292cfb114a776"
  instance_type = "t2.micro"
}