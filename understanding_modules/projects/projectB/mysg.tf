module "mysg" {
  source = "../../modules/sg"
  # from_port = 80 // you cannot edit as we have used locals in sg file. Security
}

resource "aws_instance" "myec2" {
    ami = "ami-019a292cfb114a776"
  instance_type = "t2.micro"
  vpc_security_group_ids = [module.mysg.sg_id]
}