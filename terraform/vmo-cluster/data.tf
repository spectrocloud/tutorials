# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

########################################
# Data resources for the cluster profile
########################################
data "spectrocloud_registry" "public_registry" {
  name = "Public Repo"
}

######
# MAAS
######

data "spectrocloud_cloudaccount_maas" "account" {
  count = var.deploy-maas ? 1 : 0
  name  = var.pcg-name
}

data "spectrocloud_pack" "maas_ubuntu" {
  name         = "ubuntu-maas"
  version      = "22.04"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "maas_k8s" {
  name         = "kubernetes"
  version      = "1.32.2"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "maas_cni" {
  name         = "cni-cilium-oss"
  version      = "1.17.1"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "maas_csi" {
  name         = "csi-rook-ceph-helm"
  version      = "1.16.3"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "maas_metallb" {
  name         = "lb-metallb-helm"
  version      = "0.14.9"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "maas_vmo" {
  name         = "virtual-machine-orchestrator"
  version      = "4.6.3"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_cluster" "maas_vmo_cluster" {
  count      = var.deploy-maas-vm ? 1 : 0
  depends_on = [spectrocloud_cluster_maas.maas-cluster]
  name       = "vmo-cluster-maas"
  context    = "project"
}
