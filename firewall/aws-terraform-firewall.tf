provider "aws" {
  region = "eu-west-2"
}

resource "aws_security_group" "terraform_firewall_rule" {
  name        = "terraform_firewall_rule"
  description = "Managed from terraform"
}

resource "aws_vpc_security_group_ingress_rule" "terraform_firewall_rule_ipv4" {
  security_group_id = aws_security_group.terraform_firewall_rule.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "terraform_firewall_rule_traffic_ipv4" {
  security_group_id = aws_security_group.terraform_firewall_rule.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
