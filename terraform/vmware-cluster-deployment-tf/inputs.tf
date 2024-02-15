# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

####################################
# Input resources for the profile
####################################

variable "cluster_profile_name" {
  type        = string
  description = "The name of the cluster profile."
  default     = "pcg-tutorial-profile"
}

variable "cluster_profile_description" {
  type        = string
  description = "Provide a description of the cluster profile."
  default     = "My cluster profile as part of the PCG tutorial."
}

# ToDo
# Provide a range of IP addresses for your Metallb Load Balancer. This range must be included in the PCG's static IP pool.
variable "metallb_ip" {
  type        = string
  description = "The IP address range for your MetalLB Load Balancer."
}

####################################
# Input resources for the cluster
####################################

variable "cluster_name" {
  type        = string
  description = "The name of the cluster."
  default     = "pcg-tutorial-cluster"
}

variable "tags" {
  type        = list(string)
  description = "The default tags to apply to Palette resources"
  # Value and key must be 63 characters or less, must start and end with an alphanumeric character, and can contain only alphanumeric characters, dots, dashes or underscores. 
  # Slashes `\` are not allowed.
  default = ["spectro-cloud-education", "app:hello-universe", "terraform_managed:true"]
}

#################################################
# Input resources for the cluster - Cloud config
#################################################

# ToDo 
# Export the variable below as an environment variable named "TF_VAR_ssh_key". 
# The value should include the public key for accessing the cluster nodes.
variable "ssh_key" {
  type        = string
  description = "Specify the public key that will be used to access the cluster nodes."
  sensitive   = true
}

# ToDo
# Provide the name of the datacenter in vSphere.
variable "datacenter_name" {
  type        = string
  description = "The name of the datacenter in vSphere.."
}

# ToDo
# Provide the name of the folder in vSphere. 
variable "folder_name" {
  type        = string
  description = "The name of the folder in vSphere."
}

#################################################
# Input resources for the cluster - Placement
#################################################

# ToDo
# Provide the cluster name for the machine pool as it appears in vSphere.
variable "vsphere_cluster" {
  type        = string
  description = "The name of your vSphere cluster."
}

# ToDo
# Provide the datastore name for the machine pool as it appears in vSphere.
variable "datastore_name" {
  type        = string
  description = "The name of the vSphere datastore."
}

# ToDo
# Provide the network name for the machine pool as it appears in vSphere.
variable "network_name" {
  type        = string
  description = "The name of the vSphere network."
}

# ToDo
# Provide the resource pool name for the machine pool as it appears in vSphere.
variable "resource_pool_name" {
  type        = string
  description = "The name of the vSphere resource pool."
}

#################################################
# Input resources for the Static IP Pool
#################################################

# ToDo
# Provide the IP address of the vSphere network gateway.
variable "network_gateway" {
  type        = string
  description = "The IP address of the vSphere network gateway."
}

# ToDo
# Provide the prefix of your vSphere network.
# Valid values are network CIDR subnet masks from the range 0-32. Example: 18.
variable "network_prefix" {
  type        = number
  description = "The prefix of your vSphere network."
}

# ToDo
# Provide the name of the PCG that will be used to create the static IP pool.
variable "pcg_name" {
  type        = string
  description = "The name of the IP Pool PCG."
}

# ToDo
# Provide the first IP address of your PCG IP pool range.
variable "ip_range_start" {
  type        = string
  description = "The first IP address of your PCG IP pool range."
}

# ToDo
# Provide the second IP address of your PCG IP pool range.
variable "ip_range_end" {
  type        = string
  description = "The last IP address of your PCG IP pool range."
}

# ToDo
# Provide a comma-separated list of DNS name server IP addresses.
variable "nameserver_addr" {
  type        = set(string)
  description = "The DNS nameserver IP addresses of your network."
}