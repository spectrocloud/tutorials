data "spectrocloud_pack" "csi" {
  name    = "csi-azure"
  version = "1.25.0"
}

data "spectrocloud_pack" "cni" {
  name    = "cni-calico-azure"
  version = "3.24.5"
}

data "spectrocloud_pack" "k8s" {
  name    = "kubernetes"
  version = "1.24.10"
}

data "spectrocloud_pack" "ubuntu" {
  name    = "ubuntu-azure"
  version = "20.04"
}

data "spectrocloud_pack" "proxy" {
  name    = "spectro-proxy"
  version = "1.2.0"
}