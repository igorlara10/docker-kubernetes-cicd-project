provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "devops_sg" {
  name        = "devops-sg"
  description = "Allow HTTP and app port"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "devops_ec2" {
  ami           = "ami-0c02fb55956c7d316" # Ubuntu (us-east-1)
  instance_type = "t2.micro"
  key_name      = "devops-key"
  security_groups = [aws_security_group.devops_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker.io
              systemctl start docker
              systemctl enable docker
              docker run -d -p 5000:5000 igor142536/devops-app:latest
              EOF

  tags = {
    Name = "devops-project"
  }
}
