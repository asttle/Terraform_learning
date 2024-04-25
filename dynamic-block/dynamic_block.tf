provider "aws" {
  region = "eu-west-2"
}

variable "sg_ports" {
  type = list(number)
  description = "value of ports to be opened in security group"
  default = [8000, 9000, 8200]
}

resource "aws_security_group" "new_sg" {
  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port = port.value // use the name of the dynamic block or use a iterator
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.sg_ports
    content {
      from_port = egress.value // use the name of the dynamic block or use a iterator
      to_port = egress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


}