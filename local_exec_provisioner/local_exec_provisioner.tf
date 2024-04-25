provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "local_exec" {
  ami = "ami-019a292cfb114a776"
  instance_type = "t2.micro"
  
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
}