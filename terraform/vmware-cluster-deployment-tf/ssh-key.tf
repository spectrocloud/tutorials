# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

resource "tls_private_key" "tutorial_ssh_key" {
  count     = var.ssh_key == "" ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = "4096"
}

locals {
  ssh_public_key = var.ssh_key != "" ? var.ssh_key : tls_private_key.tutorial_ssh_key[0].public_key_openssh
}

resource "local_sensitive_file" "private_key_file" {
  count    = length(tls_private_key.tutorial_ssh_key) > 0 ? 1 : 0
  content  = tls_private_key.tutorial_ssh_key[0].private_key_openssh
  filename = "${path.module}/tutorial_ssh_key"
}

resource "local_file" "public_key_file" {
  count    = length(tls_private_key.tutorial_ssh_key) > 0 ? 1 : 0
  content  = tls_private_key.tutorial_ssh_key[0].public_key_openssh
  filename = "${path.module}/tutorial_ssh_key.pub"
}

resource "terraform_data" "chmod" {
  count = length(tls_private_key.tutorial_ssh_key) > 0 ? 1 : 0
  provisioner "local-exec" {
    command = "chmod 600 ${local_sensitive_file.private_key_file[0].filename}"
  }
}


