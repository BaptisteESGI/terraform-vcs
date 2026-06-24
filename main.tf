provider "aws" {
  region  = "eu-west-1"
}

module "apache" {
  source             = "./aws_demo_apache"
  public_key         = var.public_key
  instance_name      = var.instance_name
  allowed_http_cidrs = var.allowed_http_cidrs
  allowed_ssh_cidrs  = var.allowed_ssh_cidrs
}

output "public_ip" {
  description = "Public IP of the provisioned EC2 instance"
  value       = module.test.public_ip
}