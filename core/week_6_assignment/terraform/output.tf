output "ans-ip" {
  value = aws_instance.ansible.public_ip
}
output "as-ip" {
  value = aws_instance.app-server.public_ip
}