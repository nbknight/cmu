terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Create ansible instance
resource "aws_instance" "ansible" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.ansible_instance_type
  security_groups = [aws_security_group.ansible-sg.name]
  key_name        = var.key_name

  tags = {
    Name = var.ansible_instance_name
  }
}
# Ansible server security group
resource "aws_security_group" "ansible-sg" {
  name        = "ansible-security-group"
  description = "Security group for ansible server"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
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
# Create app server instance
resource "aws_instance" "app-server" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.as_instance_type
  security_groups = [aws_security_group.app-server-sg.name]
  key_name        = var.key_name

  tags = {
    Name = var.as_instance_name
  }
}

resource "aws_security_group" "app-server-sg" {
  name        = "app-server-security-group"
  description = "Security group for app server"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
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