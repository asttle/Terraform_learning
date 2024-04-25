provider "aws" {
  region = "eu-west-2"
}

resource "aws_eip" "lb" {
  domain   = "vpc"
}