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
# The following core infrastructure layers are configured for deployment to AWS. 
# Change the name and version of the following core infrastructure layers if you want to create the profile for other cloud service providers, such as Azure or GCP. 
# Refer to the "Cloud Service Provider Configurations" section in the README for more details.  
####################################
data "spectrocloud_pack" "ubuntu" {
  name         = "ubuntu-aws"
  version      = "22.04"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "k8s" {
  name         = "kubernetes"
  version      = "1.28.2"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "cni" {
  name         = "cni-calico"
  version      = "3.26.1"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "csi" {
  name         = "csi-aws-ebs"
  version      = "1.22.0"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

####################################
# Add-On Layers
####################################

# Select the correct registry (OCI or non-OCI)

data "spectrocloud_pack" "hellouniverse" {
  name         = var.custom_addon_pack
  version      = var.custom_addon_pack_version
  registry_uid = var.use_oci_registry ? data.spectrocloud_registry_oci.hellouniverseregistry[0].id : data.spectrocloud_registry.hellouniverseregistry[0].id
}

data "spectrocloud_registry" "hellouniverseregistry" {
  count = var.use_oci_registry ? 0 : 1
  name  = var.private_pack_registry
}

data "spectrocloud_registry_oci" "hellouniverseregistry" {
  count = var.use_oci_registry ? 1 : 0
  name  = var.private_pack_registry
}

####################################
# Data resources for the cluster
####################################
data "spectrocloud_cloudaccount_aws" "account" {
  name = var.cluster_cloud_account_aws_name
}


####################################
# AWS 
####################################
data "aws_availability_zones" "available" {}