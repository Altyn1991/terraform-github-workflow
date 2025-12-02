provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

resource "aws_security_group" "example" {

  name        = "example-sg"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 80
    to_port     = 80
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

resource "aws_iam_role" "example" {
  name = "example-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99" # Amazon Linux 2 AMI for us-east-1
  instance_type = "t3.micro"
  security_groups = [aws_security_group.example.name]

  iam_instance_profile = aws_iam_instance_profile.example.name

  tags = {
    Name = "ExampleInstance"
  }
}

resource "aws_iam_instance_profile" "example" {
  name = "example-instance-profile"
  role = aws_iam_role.example.name
}
