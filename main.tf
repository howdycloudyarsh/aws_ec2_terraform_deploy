provider "aws" {
  region = "ap-south-1"  # Mumbai_region
}

resource "aws_instance" "EC2_DEPLOY" {
  ami           = "ami-08e5424edfe926b43"  # Ubuntu_server_20.04
  instance_type = "t2.micro"

  tags = {
    Name = "EC2_DEPLOY"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "echo "Hello World" > /var/www/html/index.html",
    ]
  }
}
