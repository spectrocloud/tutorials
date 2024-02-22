# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

output "Advisory" {
  value = <<-EOT
 
We recommend waiting a few minutes before clicking on the service URL to prevent the browser from caching an unresolved DNS request.

  EOT
}

output "ssh_key_location" {
  description = "Location of the private SSH key file"
  value       = length(tls_private_key.tutorial_ssh_key) > 0 ? "This is the location of your private SSH key file: ${local_sensitive_file.private_key_file[0].filename}." : null
}

output "ssh_public_key_location" {
  description = "Location of the public SSH key file"
  value       = length(tls_private_key.tutorial_ssh_key) > 0 ? "This is the location of your public SSH key file: ${local_file.public_key_file[0].filename}." : null
}

output "ssh_connection_command" {
  description = "Command to use the SSH key to connect to a VM"
  value       = length(tls_private_key.tutorial_ssh_key) > 0 ? "To access your nodes, use the following command, replacing <username> with your username and <hostname> with your hostname:  ssh -i ${local_sensitive_file.private_key_file[0].filename} <username>@<hostname>" : null
}


