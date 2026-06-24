variable "public_key" {
  description = "The public SSH key to add to the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "MyServer"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-06c66eb06932cda07"
}

variable "allowed_http_cidrs" {
  description = "CIDR blocks allowed to reach the HTTP port"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_ssh_cidrs" {
  description = "CIDR blocks allowed to reach the SSH port"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
