####################################
# Data resources for the profile
####################################
data "spectrocloud_registry" "public_registry" {
  name = "Public Repo"
}

#############
# AWS
#############
data "spectrocloud_cloudaccount_aws" "account" {
  count = var.deploy-aws ? 1 : 0
  name  = var.aws-cloud-account-name
}

data "spectrocloud_pack" "aws_csi" {
  name         = "csi-aws-ebs"
  version      = "1.22.0"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "aws_cni" {
  name         = "cni-calico"
  version      = "3.26.1"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "aws_k8s" {
  name         = "kubernetes"
  version      = "1.27.5"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "aws_ubuntu" {
  name         = "ubuntu-aws"
  version      = "22.04"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

#############
# Azure
#############
data "spectrocloud_cloudaccount_azure" "account" {
  count = var.deploy-azure ? 1 : 0
  name  = var.azure-cloud-account-name
}

data "spectrocloud_pack" "azure_csi" {
  name         = "csi-azure"
  version      = "1.28.3"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "azure_cni" {
  name         = "cni-calico-azure"
  version      = "3.26.1"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "azure_k8s" {
  name         = "kubernetes"
  version      = "1.27.5"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "azure_ubuntu" {
  name         = "ubuntu-azure"
  version      = "22.04"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

#############
# GCP
#############
data "spectrocloud_cloudaccount_gcp" "account" {
  count = var.deploy-gcp ? 1 : 0
  name  = var.gcp-cloud-account-name
}

data "spectrocloud_pack" "gcp_csi" {
  name         = "csi-gcp-driver"
  version      = "1.8.2"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "gcp_cni" {
  name         = "cni-calico"
  version      = "3.26.1"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "gcp_k8s" {
  name         = "kubernetes"
  version      = "1.27.5"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "gcp_ubuntu" {
  name         = "ubuntu-gcp"
  version      = "22.04"
  registry_uid = data.spectrocloud_registry.public_registry.id
}
