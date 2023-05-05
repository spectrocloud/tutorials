#############
# AWS
#############
data "spectrocloud_cloudaccount_aws" "account" {
  count = var.deploy-aws ? 1 : 0
  name  = var.aws-cloud-account-name
}

data "spectrocloud_pack" "aws_csi" {
  name    = "csi-aws-ebs"
  version = "1.16.0"
}
data "spectrocloud_pack" "aws_cni" {
  name    = "cni-calico"
  version = "3.24.5"
}
data "spectrocloud_pack" "aws_k8s" {
  name    = "kubernetes"
  version = "1.24.10"
}
data "spectrocloud_pack" "aws_ubuntu" {
  name    = "ubuntu-aws"
  version = "20.04"
}

#############
# Azure
#############
data "spectrocloud_cloudaccount_azure" "account" {
  count = var.deploy-azure ? 1 : 0
  name  = var.azure-cloud-account-name
}

data "spectrocloud_pack" "azure_csi" {
  name    = "csi-azure"
  version = "1.25.0"
}
data "spectrocloud_pack" "azure_cni" {
  name    = "cni-calico-azure"
  version = "3.24.5"
}
data "spectrocloud_pack" "azure_k8s" {
  name    = "kubernetes"
  version = "1.24.10"
}
data "spectrocloud_pack" "azure_ubuntu" {
  name    = "ubuntu-azure"
  version = "20.04"
}
#############
# GCP
#############
data "spectrocloud_cloudaccount_gcp" "account" {
  count = var.deploy-gcp ? 1 : 0
  name  = var.gcp-cloud-account-name
}

data "spectrocloud_pack" "gcp_csi" {
  name    = "csi-gcp-driver"
  version = "1.7.1"
}
data "spectrocloud_pack" "gcp_cni" {
  name    = "cni-calico"
  version = "3.24.5"
}
data "spectrocloud_pack" "gcp_k8s" {
  name    = "kubernetes"
  version = "1.24.10"
}
data "spectrocloud_pack" "gcp_ubuntu" {
  name    = "ubuntu-gcp"
  version = "20.04"
}
#############
# Universal
#############

data "spectrocloud_pack" "proxy" {
  name    = "spectro-proxy"
  version = "1.3.0"
}