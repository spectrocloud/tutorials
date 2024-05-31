# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

############################
# AWS Cluster Profile v1.0.0
############################
resource "spectrocloud_cluster_profile" "aws-profile" {
  count = var.deploy-aws ? 1 : 0

  name        = "tf-aws-profile"
  description = "A basic cluster profile for AWS"
  tags        = concat(var.tags, ["env:aws"])
  cloud       = "aws"
  type        = "cluster"
  version     = "1.0.0"

  pack {
    name   = data.spectrocloud_pack.aws_ubuntu.name
    tag    = data.spectrocloud_pack.aws_ubuntu.version
    uid    = data.spectrocloud_pack.aws_ubuntu.id
    values = data.spectrocloud_pack.aws_ubuntu.values
  }

  pack {
    name   = data.spectrocloud_pack.aws_k8s.name
    tag    = data.spectrocloud_pack.aws_k8s.version
    uid    = data.spectrocloud_pack.aws_k8s.id
    values = data.spectrocloud_pack.aws_k8s.values
  }

  pack {
    name   = data.spectrocloud_pack.aws_cni.name
    tag    = data.spectrocloud_pack.aws_cni.version
    uid    = data.spectrocloud_pack.aws_cni.id
    values = data.spectrocloud_pack.aws_cni.values
  }

  pack {
    name   = data.spectrocloud_pack.aws_csi.name
    tag    = data.spectrocloud_pack.aws_csi.version
    uid    = data.spectrocloud_pack.aws_csi.id
    values = data.spectrocloud_pack.aws_csi.values
  }

  pack {
    name = data.spectrocloud_pack.hellouniverse.name
    tag  = data.spectrocloud_pack.hellouniverse.version
    uid  = data.spectrocloud_pack.hellouniverse.id
    values = templatefile("manifests/values-3tier.yaml", {
      namespace   = var.app_namespace,
      port        = var.app_port,
      replicas    = var.replicas_number
      db_password = var.db_password,
      auth_token  = var.auth_token
    })
  }
}

############################
# AWS Cluster Profile v1.1.0
############################
resource "spectrocloud_cluster_profile" "aws-profile-new" {
  count = var.deploy-aws-new ? 1 : 0

  name        = "tf-aws-profile"
  description = "A basic cluster profile for AWS with Kubecost"
  tags        = concat(var.tags, ["env:aws"])
  cloud       = "aws"
  type        = "cluster"
  version     = "1.1.0"

  pack {
    name   = data.spectrocloud_pack.aws_ubuntu.name
    tag    = data.spectrocloud_pack.aws_ubuntu.version
    uid    = data.spectrocloud_pack.aws_ubuntu.id
    values = data.spectrocloud_pack.aws_ubuntu.values
  }

  pack {
    name   = data.spectrocloud_pack.aws_k8s.name
    tag    = data.spectrocloud_pack.aws_k8s.version
    uid    = data.spectrocloud_pack.aws_k8s.id
    values = data.spectrocloud_pack.aws_k8s.values
  }

  pack {
    name   = data.spectrocloud_pack.aws_cni.name
    tag    = data.spectrocloud_pack.aws_cni.version
    uid    = data.spectrocloud_pack.aws_cni.id
    values = data.spectrocloud_pack.aws_cni.values
  }

  pack {
    name   = data.spectrocloud_pack.aws_csi.name
    tag    = data.spectrocloud_pack.aws_csi.version
    uid    = data.spectrocloud_pack.aws_csi.id
    values = data.spectrocloud_pack.aws_csi.values
  }

  pack {
    name = data.spectrocloud_pack.hellouniverse.name
    tag  = data.spectrocloud_pack.hellouniverse.version
    uid  = data.spectrocloud_pack.hellouniverse.id
    values = templatefile("manifests/values-3tier.yaml", {
      namespace   = var.app_namespace,
      port        = var.app_port,
      replicas    = var.replicas_number
      db_password = var.db_password,
      auth_token  = var.auth_token
    })
  }

  pack {
    name   = data.spectrocloud_pack.kubecost.name
    tag    = data.spectrocloud_pack.kubecost.version
    uid    = data.spectrocloud_pack.kubecost.id
    values = data.spectrocloud_pack.kubecost.values
  }
}

##############################
# Azure Cluster Profile v1.0.0
##############################
resource "spectrocloud_cluster_profile" "azure-profile" {
  count = var.deploy-azure ? 1 : 0

  name        = "tf-azure-profile"
  description = "A basic cluster profile for Azure"
  tags        = concat(var.tags, ["env:azure"])
  cloud       = "azure"
  type        = "cluster"
  version     = "1.0.0"

  pack {
    name   = data.spectrocloud_pack.azure_ubuntu.name
    tag    = data.spectrocloud_pack.azure_ubuntu.version
    uid    = data.spectrocloud_pack.azure_ubuntu.id
    values = data.spectrocloud_pack.azure_ubuntu.values
  }

  pack {
    name   = data.spectrocloud_pack.azure_k8s.name
    tag    = data.spectrocloud_pack.azure_k8s.version
    uid    = data.spectrocloud_pack.azure_k8s.id
    values = data.spectrocloud_pack.azure_k8s.values
  }

  pack {
    name   = data.spectrocloud_pack.azure_cni.name
    tag    = data.spectrocloud_pack.azure_cni.version
    uid    = data.spectrocloud_pack.azure_cni.id
    values = data.spectrocloud_pack.azure_cni.values
  }

  pack {
    name   = data.spectrocloud_pack.azure_csi.name
    tag    = data.spectrocloud_pack.azure_csi.version
    uid    = data.spectrocloud_pack.azure_csi.id
    values = data.spectrocloud_pack.azure_csi.values
  }

  pack {
    name = data.spectrocloud_pack.hellouniverse.name
    tag  = data.spectrocloud_pack.hellouniverse.version
    uid  = data.spectrocloud_pack.hellouniverse.id
    values = templatefile("manifests/values-3tier.yaml", {
      namespace   = var.app_namespace,
      port        = var.app_port,
      replicas    = var.replicas_number
      db_password = var.db_password,
      auth_token  = var.auth_token
    })
  }
}

##############################
# Azure Cluster Profile v1.1.0
##############################
resource "spectrocloud_cluster_profile" "azure-profile-new" {
  count = var.deploy-azure-new ? 1 : 0

  name        = "tf-azure-profile"
  description = "A basic cluster profile for Azure with Kubecost"
  tags        = concat(var.tags, ["env:azure"])
  cloud       = "azure"
  type        = "cluster"
  version     = "1.1.0"

  pack {
    name   = data.spectrocloud_pack.azure_ubuntu.name
    tag    = data.spectrocloud_pack.azure_ubuntu.version
    uid    = data.spectrocloud_pack.azure_ubuntu.id
    values = data.spectrocloud_pack.azure_ubuntu.values
  }

  pack {
    name   = data.spectrocloud_pack.azure_k8s.name
    tag    = data.spectrocloud_pack.azure_k8s.version
    uid    = data.spectrocloud_pack.azure_k8s.id
    values = data.spectrocloud_pack.azure_k8s.values
  }

  pack {
    name   = data.spectrocloud_pack.azure_cni.name
    tag    = data.spectrocloud_pack.azure_cni.version
    uid    = data.spectrocloud_pack.azure_cni.id
    values = data.spectrocloud_pack.azure_cni.values
  }

  pack {
    name   = data.spectrocloud_pack.azure_csi.name
    tag    = data.spectrocloud_pack.azure_csi.version
    uid    = data.spectrocloud_pack.azure_csi.id
    values = data.spectrocloud_pack.azure_csi.values
  }

  pack {
    name = data.spectrocloud_pack.hellouniverse.name
    tag  = data.spectrocloud_pack.hellouniverse.version
    uid  = data.spectrocloud_pack.hellouniverse.id
    values = templatefile("manifests/values-3tier.yaml", {
      namespace   = var.app_namespace,
      port        = var.app_port,
      replicas    = var.replicas_number
      db_password = var.db_password,
      auth_token  = var.auth_token
    })
  }

  pack {
    name   = data.spectrocloud_pack.kubecost.name
    tag    = data.spectrocloud_pack.kubecost.version
    uid    = data.spectrocloud_pack.kubecost.id
    values = data.spectrocloud_pack.kubecost.values
  }
}


############################
# GCP Cluster Profile v1.0.0
############################
resource "spectrocloud_cluster_profile" "gcp-profile" {
  count = var.deploy-gcp ? 1 : 0

  name        = "tf-gcp-profile"
  description = "A basic cluster profile for GCP"
  tags        = concat(var.tags, ["env:GCP"])
  cloud       = "gcp"
  type        = "cluster"
  version     = "1.0.0"

  pack {
    name   = data.spectrocloud_pack.gcp_ubuntu.name
    tag    = data.spectrocloud_pack.gcp_ubuntu.version
    uid    = data.spectrocloud_pack.gcp_ubuntu.id
    values = data.spectrocloud_pack.gcp_ubuntu.values
  }

  pack {
    name   = data.spectrocloud_pack.gcp_k8s.name
    tag    = data.spectrocloud_pack.gcp_k8s.version
    uid    = data.spectrocloud_pack.gcp_k8s.id
    values = data.spectrocloud_pack.gcp_k8s.values
  }

  pack {
    name   = data.spectrocloud_pack.gcp_cni.name
    tag    = data.spectrocloud_pack.gcp_cni.version
    uid    = data.spectrocloud_pack.gcp_cni.id
    values = data.spectrocloud_pack.gcp_cni.values
  }

  pack {
    name   = data.spectrocloud_pack.gcp_csi.name
    tag    = data.spectrocloud_pack.gcp_csi.version
    uid    = data.spectrocloud_pack.gcp_csi.id
    values = data.spectrocloud_pack.gcp_csi.values
  }

  pack {
    name = data.spectrocloud_pack.hellouniverse.name
    tag  = data.spectrocloud_pack.hellouniverse.version
    uid  = data.spectrocloud_pack.hellouniverse.id
    values = templatefile("manifests/values-3tier.yaml", {
      namespace   = var.app_namespace,
      port        = var.app_port,
      replicas    = var.replicas_number
      db_password = var.db_password,
      auth_token  = var.auth_token
    })
  }
}

############################
# GCP Cluster Profile v1.1.0
############################
resource "spectrocloud_cluster_profile" "gcp-profile-new" {
  count = var.deploy-gcp-new ? 1 : 0

  name        = "tf-gcp-profile"
  description = "A basic cluster profile for GCP with Kubecost"
  tags        = concat(var.tags, ["env:GCP"])
  cloud       = "gcp"
  type        = "cluster"
  version     = "1.1.0"

  pack {
    name   = data.spectrocloud_pack.gcp_ubuntu.name
    tag    = data.spectrocloud_pack.gcp_ubuntu.version
    uid    = data.spectrocloud_pack.gcp_ubuntu.id
    values = data.spectrocloud_pack.gcp_ubuntu.values
  }

  pack {
    name   = data.spectrocloud_pack.gcp_k8s.name
    tag    = data.spectrocloud_pack.gcp_k8s.version
    uid    = data.spectrocloud_pack.gcp_k8s.id
    values = data.spectrocloud_pack.gcp_k8s.values
  }

  pack {
    name   = data.spectrocloud_pack.gcp_cni.name
    tag    = data.spectrocloud_pack.gcp_cni.version
    uid    = data.spectrocloud_pack.gcp_cni.id
    values = data.spectrocloud_pack.gcp_cni.values
  }

  pack {
    name   = data.spectrocloud_pack.gcp_csi.name
    tag    = data.spectrocloud_pack.gcp_csi.version
    uid    = data.spectrocloud_pack.gcp_csi.id
    values = data.spectrocloud_pack.gcp_csi.values
  }

  pack {
    name = data.spectrocloud_pack.hellouniverse.name
    tag  = data.spectrocloud_pack.hellouniverse.version
    uid  = data.spectrocloud_pack.hellouniverse.id
    values = templatefile("manifests/values-3tier.yaml", {
      namespace   = var.app_namespace,
      port        = var.app_port,
      replicas    = var.replicas_number,
      db_password = var.db_password,
      auth_token  = var.auth_token
    })
  }

  pack {
    name   = data.spectrocloud_pack.kubecost.name
    tag    = data.spectrocloud_pack.kubecost.version
    uid    = data.spectrocloud_pack.kubecost.id
    values = data.spectrocloud_pack.kubecost.values
  }
}

################################
# VMware Cluster Profile v.1.0.0
################################
resource "spectrocloud_cluster_profile" "vmware-profile" {
  count = var.deploy-vmware ? 1 : 0

  name        = "tf-vmware-profile"
  description = "A basic cluster profile for VMware"
  tags        = concat(var.tags, ["env:VMware"])
  cloud       = "vsphere"
  type        = "cluster"
  version     = "1.0.0"

  pack {
    name   = data.spectrocloud_pack.vmware_ubuntu.name
    tag    = data.spectrocloud_pack.vmware_ubuntu.version
    uid    = data.spectrocloud_pack.vmware_ubuntu.id
    values = data.spectrocloud_pack.vmware_ubuntu.values
  }

  pack {
    name   = data.spectrocloud_pack.vmware_k8s.name
    tag    = data.spectrocloud_pack.vmware_k8s.version
    uid    = data.spectrocloud_pack.vmware_k8s.id
    values = data.spectrocloud_pack.vmware_k8s.values
  }

  pack {
    name   = data.spectrocloud_pack.vmware_cni.name
    tag    = data.spectrocloud_pack.vmware_cni.version
    uid    = data.spectrocloud_pack.vmware_cni.id
    values = data.spectrocloud_pack.vmware_cni.values
  }

  pack {
    name   = data.spectrocloud_pack.vmware_csi.name
    tag    = data.spectrocloud_pack.vmware_csi.version
    uid    = data.spectrocloud_pack.vmware_csi.id
    values = data.spectrocloud_pack.vmware_csi.values
  }

  pack {
    name   = data.spectrocloud_pack.vmware_metallb.name
    tag    = data.spectrocloud_pack.vmware_metallb.version
    uid    = data.spectrocloud_pack.vmware_metallb.id
    values = replace(data.spectrocloud_pack.vmware_metallb.values, "192.168.10.0/24", var.metallb_ip)
  }

  pack {
    name = data.spectrocloud_pack.hellouniverse.name
    tag  = data.spectrocloud_pack.hellouniverse.version
    uid  = data.spectrocloud_pack.hellouniverse.id
    values = templatefile("manifests/values-3tier.yaml", {
      namespace   = var.app_namespace,
      port        = var.app_port,
      replicas    = var.replicas_number,
      db_password = var.db_password,
      auth_token  = var.auth_token
    })
  }
}

###############################
# VMware Cluster Profile v1.1.0
###############################
resource "spectrocloud_cluster_profile" "vmware-profile-new" {
  count = var.deploy-vmware-new ? 1 : 0

  name        = "tf-vmware-profile"
  description = "A basic cluster profile for VMware with Kubecost"
  tags        = concat(var.tags, ["env:VMware"])
  cloud       = "vsphere"
  type        = "cluster"
  version     = "1.1.0"

  pack {
    name   = data.spectrocloud_pack.vmware_ubuntu.name
    tag    = data.spectrocloud_pack.vmware_ubuntu.version
    uid    = data.spectrocloud_pack.vmware_ubuntu.id
    values = data.spectrocloud_pack.vmware_ubuntu.values
  }

  pack {
    name   = data.spectrocloud_pack.vmware_k8s.name
    tag    = data.spectrocloud_pack.vmware_k8s.version
    uid    = data.spectrocloud_pack.vmware_k8s.id
    values = data.spectrocloud_pack.vmware_k8s.values
  }

  pack {
    name   = data.spectrocloud_pack.vmware_cni.name
    tag    = data.spectrocloud_pack.vmware_cni.version
    uid    = data.spectrocloud_pack.vmware_cni.id
    values = data.spectrocloud_pack.vmware_cni.values
  }

  pack {
    name   = data.spectrocloud_pack.vmware_csi.name
    tag    = data.spectrocloud_pack.vmware_csi.version
    uid    = data.spectrocloud_pack.vmware_csi.id
    values = data.spectrocloud_pack.vmware_csi.values
  }

  pack {
    name   = data.spectrocloud_pack.vmware_metallb.name
    tag    = data.spectrocloud_pack.vmware_metallb.version
    uid    = data.spectrocloud_pack.vmware_metallb.id
    values = replace(data.spectrocloud_pack.vmware_metallb.values, "192.168.10.0/24", var.metallb_ip)
  }

  pack {
    name = data.spectrocloud_pack.hellouniverse.name
    tag  = data.spectrocloud_pack.hellouniverse.version
    uid  = data.spectrocloud_pack.hellouniverse.id
    values = templatefile("manifests/values-3tier.yaml", {
      namespace   = var.app_namespace,
      port        = var.app_port,
      replicas    = var.replicas_number,
      db_password = var.db_password,
      auth_token  = var.auth_token
    })
  }

  pack {
    name   = data.spectrocloud_pack.kubecost.name
    tag    = data.spectrocloud_pack.kubecost.version
    uid    = data.spectrocloud_pack.kubecost.id
    values = data.spectrocloud_pack.kubecost.values
  }
}