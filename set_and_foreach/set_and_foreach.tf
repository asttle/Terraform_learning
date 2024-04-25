provider "aws" {
  region = "eu-west-2"
}

resource "aws_iam_user" "terraform_group" {
   for_each = toset(["user1", "user2", "user3"])
   name = each.key
}

resource "aws_instance" "for_each_test" {
  ami = "ami-0c618421e207909d0"
  for_each = {
    key1 = "t2.micro",
    key2 = "t2.small",
  }
  instance_type = each.value
  key_name = each.key
  tags = {
    Name = each.value
  }
}