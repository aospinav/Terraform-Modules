output "sg_ssh_id" {
  value = aws_security_group.sg_ssh.id
}
output "sg_http_id" {
  value = aws_security_group.sg_http.id
}
output "sg_private_http_id" {
  value = aws_security_group.sg_private_http.id
}