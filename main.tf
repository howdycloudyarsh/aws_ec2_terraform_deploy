provider "aws" {
  region = "ap-south-1"  # Mumbai_region
}
resource "aws_instance" "EC2_Frontend" {
    instance_type = "t2.micro"
    ami = "ami-08e5424edfe926b43"
    key_name = "ubuntu"
    tags = {
      name = "Frontend-Server"
    }
}
