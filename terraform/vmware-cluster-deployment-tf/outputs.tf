# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

output "Advisory" {
  value = <<-EOT
 
We recommend waiting a few minutes before clicking on the service URL to prevent the browser from caching an unresolved DNS request.

EOT
}

output "profile_id" {
  value = spectrocloud_cluster_profile.profile.id
}
