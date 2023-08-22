provider "aws" {
  region = "ap-south-1"  # Mumbai_region
}

resource "aws_instance" "nginx" {
  ami           = "ami-08e5424edfe926b43"  # Ubuntu_server_20.04
  instance_type = "t2.micro"

  tags = {
    Name = "nginx"
  }

provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]
  }
}
