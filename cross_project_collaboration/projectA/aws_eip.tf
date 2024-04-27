provider "aws" {
    region = "eu-west-2"
}

resource "aws_eip" "cross_project_eip" {
    domain = "vpc"
}

output "aws_eip_id" {
    value = aws_eip.cross_project_eip.public_ip
}