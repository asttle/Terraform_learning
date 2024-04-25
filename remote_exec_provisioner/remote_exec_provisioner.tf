provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "remote_exec" {
  ami = "ami-019a292cfb114a776"
  instance_type = "t2.micro"
  key_name = "terraform_remote_exec"
  vpc_security_group_ids = ["sg-0f2f990559006216e"]

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("./terraform_remote_exec.pem")
    host = self.public_ip
  }
  
  provisioner "remote-exec" {
    inline = [ "sudo yum -y install nginx", "sudo systemctl start nginx",]
  }
}