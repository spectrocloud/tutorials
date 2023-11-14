
resource "spectrocloud_cluster_profile" "profile" {
  name        = var.cluster_profile_name
  description = var.cluster_profile_description
  tags        = var.tags
  cloud       = "aws"     # Possible values: "aws", "azure", "gcp" 
  type        = "cluster" # Possible values: "cluster", "add-on"

  ############################
  # Core layers
  ############################
  # Packs below have a static name and tag value. Refer to the HubbleAPI collection before changing these value.
  pack {
    name   = "ubuntu-aws"
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
    name   = "csi-aws-ebs"
    tag    = "1.22.x"
    uid    = data.spectrocloud_pack.csi.id
    values = data.spectrocloud_pack.csi.values
  }

  ############################
  # Add-on layer
  ############################
  # Refer to https://docs.spectrocloud.com/integrations/frp/ for more details on Spectro Proxy pack.
  pack {
    name   = "spectro-proxy" # Static value. Refer to the HubbleAPI collection before changing this value.
    tag    = "1.4.x"
    uid    = data.spectrocloud_pack.spectro-proxy.id
    values = data.spectrocloud_pack.spectro-proxy.values
  }

  # Custom add-on pack
  pack {
    name   = "hellouniverse"
    tag    = "1.0.x"
    uid    = data.spectrocloud_pack.hellouniverse.id
    values = data.spectrocloud_pack.hellouniverse.values
  }
}