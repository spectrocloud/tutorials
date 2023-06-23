
resource "spectrocloud_cluster_profile" "profile" {
  name        = var.cluster_profile_name
  description = var.cluster_profile_description
  tags        = var.tags
  cloud       = "edge-native"             # Possible values: "aws", "azure", "gcp", "edge-native" 
  type        = "cluster"                 # Possible values: "cluster", "add-on"

  ############################
  # Core layers
  ############################
  # Packs below have a static name and tag value. Refer to the HubbleAPI collection before changing these value.
  pack {
    name    = "edge-native-byoi"
    tag     = "1.0.0"
    uid     = data.spectrocloud_pack.edge-native-byoi.id
    values  = file("manifests/custom-content.yaml")
  }

  pack {
    name    = "edge-k3s"
    tag     = "1.25.x"
    uid     = data.spectrocloud_pack.edge-k3s.id
    values  = data.spectrocloud_pack.edge-k3s.values
  }

  pack {
    name    = "cni-calico"
    tag     = "3.25.x"
    uid     = data.spectrocloud_pack.cni-calico.id
    values  = data.spectrocloud_pack.cni-calico.values
  }

  ############################
  # Manifest layer
  ############################
  pack {
    name = "hello-universe"
    type = "manifest"
    manifest {
      name    = "hello-universe"
      content = file("manifests/hello-universe.yaml")
    }
  }
}