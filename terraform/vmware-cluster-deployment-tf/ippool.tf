# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

# Required for static IP placement.
# resource "spectrocloud_privatecloudgateway_ippool" "ippool" {
#   gateway                  = var.network_gateway
#   name                     = "${var.cluster_name}-ippool"
#   network_type             = "range"
#   prefix                   = var.network_prefix
#   private_cloud_gateway_id = data.spectrocloud_private_cloud_gateway.pcg.id
#   ip_start_range           = var.ip_range_start
#   ip_end_range             = var.ip_range_end
#   nameserver_addresses     = var.nameserver_addr
# }