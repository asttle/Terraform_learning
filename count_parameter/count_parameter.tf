provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "count_parameter" {
  count = 3
  ami = "ami-0c618421e207909d0"
  instance_type = "t2.micro"
  tags = {
    Name = "count_parameter-${count.index}"
  }
}

variable "usernames" {
  type = list(string)
  default = ["dev", "prod", "stage"]
}

resource "aws_iam_user" "org_user" {
  count = 3
  name = var.usernames[count.index]
}