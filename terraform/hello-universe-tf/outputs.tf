# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

# output "beehive-cluster-id" {
#   value = data.spectrocloud_cluster_group.beehive.id
# }

# output "hello-universie-ui-app-profile-id" {
#   value = spectrocloud_application_profile.hello-universe-ui.id
# }

# output "hello-universie-ui-app-profile-registry-id" {
#   value = spectrocloud_application_profile.hello-universe-ui.pack[0].registry_uid
# }

output "Advisory" {
  value = <<-EOT

It takes between one to three minutes for DNS to properly resolve the public load balancer URL. 
We recommend waiting a few moments before clicking on the service URL to prevent the browser from caching an unresolved DNS request.

EOT
}