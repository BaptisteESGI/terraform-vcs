Terraform Module to provision an EC2 Instance that is running Apache.

Not intended for production use. Just showcasing 

```hcl
output "public_ip" {
  value = aws_instance.my_server.public_ip
}
```


