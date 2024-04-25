provider "aws" {
  region = "eu-west-2"
}

resource "aws_eip" "lb" {
  domain   = "vpc"
}
 
resource "aws_security_group" "terraform_firewall_rule" {
  name        = "terraform_firewall_rule"
  description = "Managed from terraform"
}

resource "aws_vpc_security_group_ingress_rule" "terraform_firewall_rule_ipv4" {
  security_group_id = aws_security_group.terraform_firewall_rule.id
  cidr_ipv4 = "${aws_eip.lb.public_ip}/32"
  from_port = "80"
  ip_protocol = "tcp"
  to_port = "80"
}

output "public_ip" {
    value = aws_eip.lb.public_ip
}

output "security_group_id" {
    value = aws_security_group.terraform_firewall_rule.id
}