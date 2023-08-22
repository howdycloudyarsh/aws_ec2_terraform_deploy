provider "aws" {
  region = "ap-south-1"  # Mumbai_region
}
resource "aws_instance" "ec2-web" {
ami           = "ami-08e5424edfe926b43" # us-west-2
instance_type = "t2.micro"
key_name = "tf-key-pair"
user_data = <<-EOF
#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo bash -c 'echo your very first web server > /var/www/html/index.html'
EOF
tags = {
Name = "first-ec2-server"
}
}
output "server_private_ip" {
value = aws_instance.ec2-web.private_ip
}
output "server_public_ipv4" {
value = aws_instance.ec2-web.public_ip
}
output "server_id" {
value = aws_instance.ec2-web.id
}
resource "aws_key_pair" "tf-key-pair" {
key_name = "tf-key-pair"
public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
algorithm = "RSA"
rsa_bits  = 4096
}
resource "local_file" "tf-key" {
content  = tls_private_key.rsa.private_key_pem
filename = "tf-key-pair"
}
