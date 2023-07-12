resource "tls_private_key" "tutorial_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}