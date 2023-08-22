provider "aws" {
  region = "ap-south-1"  # Mumbai_region
}

resource "aws_key_pair" "example_keypair" {
  key_name   = "example-keypair"  # Change this to your desired key pair name
  public_key = file("~/.ssh/id_rsa.pub")  # Path to your public key
}

resource "aws_instance" "example_instance" {
  ami           = "ami-08e5424edfe926b43"  # Ubuntu 20.04 LTS AMI ID
  instance_type = "t2.micro"  # Change this to the desired instance type

  tags = {
    Name = "ExampleInstance"
  }

  key_name = aws_key_pair.example_keypair.key_name

  tags = {
    Name = "nginx1"
  }

connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")  # Path to your SSH private key
    host        = self.public_ip
  }

  user_data = <<EOF
#!/bin/bash
"sudo apt-get update",
"sudo apt-get install nginx -y",
"sudo systemctl enable nginx",
"sudo systemctl start nginx"
"sudo echo Hello World >/var/www/html/index.nginx-debian.html  
EOF
    ]
  }
}
