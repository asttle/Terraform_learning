provider "aws" {
  region = "eu-west-2"
}

resource "aws_iam_user" "demouser" {
    name = "terraform-demo-user"
}