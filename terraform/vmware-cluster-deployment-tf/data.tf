# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

####################################
# Data resources for the profile
####################################
data "spectrocloud_registry" "public_registry" {
  name = "Public Repo"
}

####################################
# Core Infrastructure Layers
# The following core infrastructure layers are configured for deployment to Vsphere. 
# Change the name and version of the following core infrastructure layers if you want to create the profile for other cloud service providers. 
####################################
data "spectrocloud_pack" "ubuntu" {
  name         = "ubuntu-vsphere"
  version      = "22.04"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "k8s" {
  name         = "kubernetes"
  version      = "1.28.3"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "cni" {
  name         = "cni-calico"
  version      = "3.26.3"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "csi" {
  name         = "csi-vsphere-csi"
  version      = "3.0.2"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "metallb" {
  name         = "lb-metallb"
  version      = "0.13.7"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

####################################
# Add-On Layers
####################################

#data "spectrocloud_pack" "hellouniverse" {
#  name         = 
#  version      = 
#  registry_uid = data.spectrocloud_registry.public_registry.id
#}

####################################
# Data resources for the cluster
####################################
data "spectrocloud_cloudaccount_vsphere" "account" {
  name = var.pcg_name
}


####################################
# Data resources for the PCG
####################################
data "spectrocloud_private_cloud_gateway" "pcg" {
  name = var.pcg_name
}