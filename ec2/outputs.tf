output "public_ip" {
  value = aws_instance.dev_instance.public_ip
}

output "ssh_command" {
  value = "ssh -i ssh-key/key ec2-user@${aws_instance.dev_instance.public_ip}"
}
