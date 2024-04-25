resource "aws_instance" "modeule_ec2" {
  ami = "ami-019a292cfb114a776"
  instance_type = var.instance_type
}