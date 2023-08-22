provider "aws" {
  region = "ap-south-1"  # Mumbai_region
}

resource "aws_key_pair" "rajkey" {
  key_name   = "rajkey"  # Change this to your desired key pair name
  public_key = file("~/.ssh/id_rsa.pub")  # Path to your public key
}

resource "aws_instance" "raj" {
  ami           = "ami-08e5424edfe926b43"  # Ubuntu 20.04 LTS AMI ID
  instance_type = "t2.micro"  # Change this to the desired instance type
  key_name = aws_key_pair.rajkey.key_name
