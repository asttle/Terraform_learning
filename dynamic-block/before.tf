# provider "aws" {
#   region = "eu-west-2"
# }

# resource "aws_security_group" "new_sg" {
#     ingress {
#       from_port = 8000
#       to_port = 8000
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]  
#     } 

#     ingress {
#       from_port = 9000
#       to_port = 9000
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]  
#     } 

#     ingress {
#       from_port = 8200
#       to_port = 8200
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]  
#     }
# }