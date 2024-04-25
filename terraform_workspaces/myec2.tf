provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "workspace_ec2" {
  ami = "ami-019a292cfb114a776"
  instance_type = lookup(var.instance_type, terraform.workspace)
}

variable "instance_type" {
  default = {
    default = "t2.micro",
    dev = "t2.micro",
    prod = "t2.large"
  }
  type= map(string)
  description = "list of instance types for different environments"
  
}