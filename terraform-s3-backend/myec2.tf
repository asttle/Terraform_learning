provider "aws" {
  region = "eu-west-2" 
}

resource "aws_instance" "backend-test" {
  ami = "ami-019a292cfb114a776"
  instance_type = "t2.micro"
}