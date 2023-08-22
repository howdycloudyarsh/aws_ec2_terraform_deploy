provider "aws" {
  region = "ap-south-1"  # Mumbai_region
}

resource "aws_instance" "example" {
  ami           = "ami-08e5424edfe926b43"  # Ubuntu_server_20.04
  instance_type = "t2.micro"

user_data = <<-EOT
    #!/bin/bash
    # Install all available updates and nginx
    apt-get update -y
    apt-get install nginx -y

    # Start nginx
    systemctl enable nginx
    systemctl start nginx
    echo "Hello World" > /var/www/html/index.html
    EOT
}
