resource "aws_instance" "count_parameter" {
  count = 3
  ami = "ami-019a292cfb114a776"
  instance_type = "t2.micro"
  tags = {
    Name = "count_parameter-${count.index}"
  }
}
