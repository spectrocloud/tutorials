# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0


resource "spectrocloud_cluster_profile" "profile" {
  name        = var.cluster_profile_name
  description = var.cluster_profile_description
  tags        = var.tags
  cloud       = "vsphere"
  type        = "cluster"

  ############################
  # Core layers
  ############################
  # The packs listed below have a static name and tag value. Refer to the HubbleAPI collection before changing these values.
  pack {
    name   = "ubuntu-vsphere"
    tag    = "LTS__22.4.x"
    uid    = data.spectrocloud_pack.ubuntu.id
    values = data.spectrocloud_pack.ubuntu.values
  }

  pack {
    name   = "kubernetes"
    tag    = "1.28.x"
    uid    = data.spectrocloud_pack.k8s.id
    values = data.spectrocloud_pack.k8s.values
  }

  pack {
    name   = "cni-calico"
    tag    = "3.26.x"
    uid    = data.spectrocloud_pack.cni.id
    values = data.spectrocloud_pack.cni.values
  }

  pack {
    name   = "csi-vsphere-csi"
    tag    = "3.0.x"
    uid    = data.spectrocloud_pack.csi.id
    values = data.spectrocloud_pack.csi.values
  }

  pack {
    name   = "lb-metallb-helm"
    tag    = "0.13.x"
    uid    = data.spectrocloud_pack.metallb.id
    values = replace(data.spectrocloud_pack.metallb.values, "192.168.10.0/24", var.metallb_ip)
  }

  ############################
  # Add-on layer
  ############################

  pack {
    name   = "hello-universe"
    tag    = "1.1.x"
    uid    = data.spectrocloud_pack.hellouniverse.id
    values = data.spectrocloud_pack.hellouniverse.values
  }


}