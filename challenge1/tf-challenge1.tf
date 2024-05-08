
terraform {
  required_version = "~> 1.5.7"
}

provider "aws" {
  version = "~> 2.54"
  region = "eu-west-2"
}

resource "aws_eip" "kplabs_app_ip" {
    vpc = true
}
