resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  for_each = toset(var.allowed_http_cidrs)

  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4   = each.value
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  description = "Allow HTTP from ${each.value}"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  for_each = toset(var.allowed_ssh_cidrs)

  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4   = each.value
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"

  description = "Allow SSH from ${each.value}"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}