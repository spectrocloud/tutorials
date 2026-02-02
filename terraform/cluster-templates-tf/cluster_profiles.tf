# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

############################
# AWS Cluster Profile v1.0.0
############################
resource "spectrocloud_cluster_profile" "aws_profile" {
  name        = "brent-aws-profile-for-cluster-template"
  description = "AWS cluster profile created with Terraform"
  tags        = concat(var.tags, ["env:aws"])
  cloud       = "aws"
  type        = "cluster"
  version     = "1.0.0"

  pack {
    name   = data.spectrocloud_pack.aws_ubuntu.name
    tag    = data.spectrocloud_pack.aws_ubuntu.version
    uid    = data.spectrocloud_pack.aws_ubuntu.id
    values = data.spectrocloud_pack.aws_ubuntu.values
    type   = "spectro"
  }

  pack {
    name   = data.spectrocloud_pack.aws_k8s.name
    tag    = data.spectrocloud_pack.aws_k8s.version
    uid    = data.spectrocloud_pack.aws_k8s.id
    values = data.spectrocloud_pack.aws_k8s.values
    type   = "spectro"
  }

  pack {
    name   = data.spectrocloud_pack.aws_cni.name
    tag    = data.spectrocloud_pack.aws_cni.version
    uid    = data.spectrocloud_pack.aws_cni.id
    values = data.spectrocloud_pack.aws_cni.values
    type   = "spectro"
  }

  pack {
    name   = data.spectrocloud_pack.aws_csi.name
    tag    = data.spectrocloud_pack.aws_csi.version
    uid    = data.spectrocloud_pack.aws_csi.id
    values = data.spectrocloud_pack.aws_csi.values
    type   = "spectro"
  }

  pack {
    name = data.spectrocloud_pack.hellouniverse.name
    tag  = data.spectrocloud_pack.hellouniverse.version
    uid  = data.spectrocloud_pack.hellouniverse.id
    type = "oci"

    values = data.spectrocloud_pack.hellouniverse.values

  }
}
