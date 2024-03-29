output "aws_security_group_http_server_details" {
  value = aws_security_group.http_server_sg
}

output "aws_ec2_instance_details" {
  value = aws_instance.http_server
}

output "aws_ec2_instance_public_dns" {
  value = aws_instance.http_server.public_dns
}
