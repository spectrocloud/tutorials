# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

########################################
# Data resources for the cluster profile
########################################

data "spectrocloud_project" "current" {
  name = var.palette-project
}

data "spectrocloud_registry" "public_registry" {
  name = "Public Repo"
}

data "spectrocloud_registry" "community_registry" {
  name = "Palette Community Registry"
}

#############
# AWS
#############

data "spectrocloud_pack" "aws_ubuntu" {
  name         = "ubuntu-aws"
  version      = "22.04"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "aws_k8s" {
  name         = "kubernetes"
  version      = "1.33.6"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "aws_cni" {
  name         = "cni-calico"
  version      = "3.31.2"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "aws_csi" {
  name         = "csi-aws-ebs"
  version      = "1.46.0"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

#############
# Azure
#############

data "spectrocloud_pack" "azure_ubuntu" {
  name         = "ubuntu-azure"
  version      = "22.04"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "azure_k8s" {
  name         = "kubernetes"
  version      = "1.33.6"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "azure_cni" {
  name         = "cni-calico-azure"
  version      = "3.31.2"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "azure_csi" {
  name         = "csi-azure"
  version      = "1.31.2-rev2"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

#####################
# Hello Universe Pack
#####################

data "spectrocloud_pack" "hellouniverse" {
  name         = "hello-universe"
  version      = "1.3.0"
  registry_uid = data.spectrocloud_registry.community_registry.id
}
