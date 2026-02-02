# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

########################################
# Data resources for the cluster profile
########################################

data "spectrocloud_registry" "public_registry" {
  name = "Public Repo"
}

data "spectrocloud_registry" "community_registry" {
  name = "Palette Community Registry"
}

data "spectrocloud_pack" "aws_ubuntu" {
  name         = "ubuntu-aws"
  version      = "22.04"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "aws_k8s" {
  name         = "kubernetes"
  version      = "1.32.3"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "aws_cni" {
  name         = "cni-calico"
  version      = "3.29.3"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "aws_csi" {
  name         = "csi-aws-ebs"
  version      = "1.41.0"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "hellouniverse" {
  name         = "hello-universe"
  version      = "1.2.0"
  registry_uid = data.spectrocloud_registry.community_registry.id
}
