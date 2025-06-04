# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

output "Advisory" {
  value = <<-EOT

It takes between one to three minutes for DNS to properly resolve the public load balancer URL. 
We recommend waiting a few minutes before clicking on the service URL to prevent the browser from caching an unresolved DNS request.

EOT
}

