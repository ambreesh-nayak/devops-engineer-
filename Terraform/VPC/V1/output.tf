output "subnet_id" {
    value = aws_subnet.pub.id
}

output "sg_id" {
  value = aws_security_group.firewall.id
}
