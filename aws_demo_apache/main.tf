terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.50.0"
    }
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "${var.instance_name}-key"
  public_key = var.public_key
}

resource "aws_instance" "my_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data              = file("${path.module}/userdata.yml")

  tags = {
    Name = var.instance_name
  }
}


