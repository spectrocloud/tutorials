####################################
# Data resources for the profile
####################################
data "spectrocloud_registry" "public_registry" {
  name      = "Public Repo"
}

data "spectrocloud_pack" "edge-native-byoi" {
  name      = "edge-native-byoi"
  version   = "1.0.0"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "edge-k3s" {
  name      = "edge-k3s"
  version   = "1.25.2"
  registry_uid = data.spectrocloud_registry.public_registry.id
}

data "spectrocloud_pack" "cni-calico" {
  name      = "cni-calico"
  version   = "3.25.1"
  registry_uid = data.spectrocloud_registry.public_registry.id
}