#########################
# AWS Cluster Profile
#########################
resource "spectrocloud_cluster_profile" "aws-profile" {
  count = var.deploy-aws ? 1 : 0

  name  = "tf-aws-profile"
  tags  = concat(var.tags, ["aws"])
  cloud = "aws"
  type  = "cluster"

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
    name   = "hello-universe"
    type   = "manifest"
    tag    = "1.0.0"
    values = ""
    manifest {
      name    = "hello-universe"
      content = file("manifest.yaml")
    }
  }
}

#########################
# Azure Cluster Profile
#########################
resource "spectrocloud_cluster_profile" "azure-profile" {
  count = var.deploy-azure ? 1 : 0

  name  = "tf-azure-profile"
  tags  = concat(var.tags, ["azure"])
  cloud = "azure"
  type  = "cluster"

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
    name   = "hello-universe"
    type   = "manifest"
    tag    = "1.0.0"
    values = ""
    manifest {
      name    = "hello-universe"
      content = file("manifest.yaml")
    }
  }
}


#########################
# GCP Cluster Profile
#########################
resource "spectrocloud_cluster_profile" "gcp-profile" {
  count = var.deploy-gcp ? 1 : 0

  name  = "tf-gcp-profile"
  tags  = concat(var.tags, ["gcp"])
  cloud = "gcp"
  type  = "cluster"

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
    name   = "hello-universe"
    type   = "manifest"
    tag    = "1.0.0"
    values = ""
    manifest {
      name    = "hello-universe"
      content = file("manifest.yaml")
    }
  }
}