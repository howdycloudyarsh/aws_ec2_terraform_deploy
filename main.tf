provider "aws" {
  region = "ap-south-1"  # Mumbai_region
}

resource "aws_instance" "nginx1" {
  ami           = "ami-08e5424edfe926b43"  # Ubuntu_server_20.04
  instance_type = "t2.micro"

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
