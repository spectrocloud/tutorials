################################
# Data for profile
################################
data "spectrocloud_registry" "public_registry" {
  name      = "Public Repo"
}

data "spectrocloud_pack" "ubuntu" {
  name      = "ubuntu-aws"
  version   = "20.04"
}

data "spectrocloud_pack" "k8s" {
  name      = "kubernetes"
  version   = "1.24.10"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "cni" {
  name      = "cni-calico"
  version   = "3.25.0"
}

data "spectrocloud_pack" "csi" {
  name      = "csi-aws-ebs"
  version   = "1.16.0"
}

data "spectrocloud_pack" "spectro-proxy" {
  name      = "spectro-proxy"
  version   = "1.3.0"
  type      = "spectro"
}


data "spectrocloud_pack" "hellouniverse" {
  name  = var.custom_addon_pack           # ToDo: Change the value here.
  version   = "1.0.0"                     # ToDo: Change the value here.
  registry_uid = data.spectrocloud_registry.hellouniverseregistry.id
}

data "spectrocloud_registry" "hellouniverseregistry" {
  name  = var.private_pack_registry      # ToDo: Change the value here.
}

################################
# Data for cluster
################################
data "spectrocloud_cloudaccount_aws" "account" {
  name  = var.cluster_cloud_account_aws_name
}