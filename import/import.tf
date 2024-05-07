provider "aws" {
  region = "eu-west-2"
}

import {
   to = aws_security_group.importsg
   id = "sg-0f2f990559006216e"
}