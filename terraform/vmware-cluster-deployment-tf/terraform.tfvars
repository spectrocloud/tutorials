# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

# Static IP Pool Variables
# Required for static IP placement only.
# network_gateway = "REPLACE ME"   # Provide the IP address of the vSphere network gateway.
# network_prefix  = "REPLACE ME"            # Provide the prefix of your vSphere network. Valid values are network CIDR subnet masks from the range 0-32. Example: 18.
# ip_range_start  = "REPLACE ME"  # Provide the first IP address of your PCG IP pool range.
# ip_range_end    = "REPLACE ME"  # Provide the second IP address of your PCG IP pool range.
# nameserver_addr = ["REPLACE ME"] # Provide a comma-separated list of DNS name server IP addresses.


# Cluster Profile Variables
metallb_ip = "REPLACE ME" # Provide a range of IP addresses for your Metallb Load Balancer. This range must be included in the PCG's static IP pool range if using static IP placement.


# Cluster Variables
pcg_name           = "REPLACE ME" # Provide the name of the PCG that will be used to deploy the Palette cluster.
datacenter_name    = "REPLACE ME" # Provide the name of the datacenter in vSphere.
folder_name        = "REPLACE ME" # Provide the name of the folder in vSphere.
search_domain      = "REPLACE ME" # Provide the name of the network search domain.
vsphere_cluster    = "REPLACE ME" # Provide the cluster name for the machine pool as it appears in vSphere.
datastore_name     = "REPLACE ME" # Provide the datastore name for the machine pool as it appears in vSphere.
network_name       = "REPLACE ME" # Provide the network name for the machine pool as it appears in vSphere.
resource_pool_name = "REPLACE ME" # Provide the resource pool name for the machine pool as it appears in vSphere.
ssh_key            = ""           # Provide the path to your public SSH key. If not provided, a new key pair will be created.
ssh_key_private    = ""           # Provide the path to your private SSH key. If not provided, a new key pair will be created.