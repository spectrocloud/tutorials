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