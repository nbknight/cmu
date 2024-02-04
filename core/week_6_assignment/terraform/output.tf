output "central-public-ip" {
  value = aws_instance.central.public_ip
}
output "central-private-ip" {
  value = aws_instance.central.private_ip
}
output "as-public-ip" {
  value = aws_instance.app-server.public_ip
}
output "as-private-ip" {
  value = aws_instance.app-server.private_ip
}