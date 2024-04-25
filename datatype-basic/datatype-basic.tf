provider "aws" {
  region = "eu-west-2"
}

variable "username" {
  type = number
}

resource "aws_iam_user" "lb" {
  name = var.username
}