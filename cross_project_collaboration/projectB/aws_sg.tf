provider "aws" {
   region = "eu-west-2"
}

resource "aws_security_group" "name" {
    name        = "cross_project_sg"
    description = "Allow inbound traffic on port 8000 from the EIP of the remote state"
   ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.eip.outputs.aws_eip_id}/32"]
   }
}