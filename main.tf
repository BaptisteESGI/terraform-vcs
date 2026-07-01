terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Usine_a_gaz"

    workspaces {
      name = "Terraform-vcs"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.50.0"
    }
  }
}

resource "aws_instance" "my_server" {
  ami           = "ami-06c66eb06932cda07"
  instance_type = var.instance_type
}

output "public_ip" {
  value = aws_instance.my_server.public_ip
}