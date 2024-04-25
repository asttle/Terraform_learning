provider "aws" {
  region = "eu-west-2"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = ["sg-010de64be426c34cf"]
  subnet_id              = "subnet-0c02d5ad4940818ec"
  ami = "ami-019a292cfb114a776"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}