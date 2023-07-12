output "ssh-key" {
  value = tls_private_key.tutorial_ssh_key.public_key_openssh
}