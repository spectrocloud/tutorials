
resource "spectrocloud_cluster_profile" "profile" {
  name        = var.cluster_profile_name
  description = var.cluster_profile_description
  tags        = var.tags
  # tags        = ["dev", "department:docs"]
  cloud       = "aws"                     # Possible values: "aws", "azure", "gcp" 
  type        = "cluster"                 # Possible values: "cluster", "add-on"

  ############################
  # Core layers
  ############################
  # Packs below have a static name and tag value. Refer to the HubbleAPI collection before changing these value.
  pack {
    name    = "ubuntu-aws"
    tag     = "LTS__20.4.x"
    uid     = data.spectrocloud_pack.ubuntu.id
    values  = data.spectrocloud_pack.ubuntu.values
  }

  pack {
    name    = "kubernetes"
    tag     = "1.24.x"
    uid     = data.spectrocloud_pack.k8s.id
    values  = data.spectrocloud_pack.k8s.values
  }

  pack {
    name    = "cni-calico"
    tag     = "3.25.x"
    uid     = data.spectrocloud_pack.cni.id
    values  = data.spectrocloud_pack.cni.values
  }

  pack {
    name    = "csi-aws-ebs"
    tag     = "1.16.x"
    uid     = data.spectrocloud_pack.csi.id
    values  = data.spectrocloud_pack.csi.values
  }

  ############################
  # Add-on layer
  ############################
  # Refer to https://docs.spectrocloud.com/integrations/frp/ for more details on Spectro Proxy pack.
  pack {
    name    = "spectro-proxy"               # Static value. Refer to the HubbleAPI collection before changing this value.
    tag     = "1.3.x"
    uid     = data.spectrocloud_pack.spectro-proxy.id
    values  = local.proxy_val
  }

# Custom add-on pack
pack {
    name    = "hellouniverse"
    tag     = "1.0.x"
    uid     = data.spectrocloud_pack.hellouniverse.id
    values  = data.spectrocloud_pack.hellouniverse.values
  }
}

locals {
  proxy_val = <<-EOT
        manifests:
          spectro-proxy:
            namespace: "cluster-{{ .spectro.system.cluster.uid }}"
            server: "{{ .spectro.system.reverseproxy.server }}"
            clusterUid: "{{ .spectro.system.cluster.uid }}"
            subdomain: "cluster-{{ .spectro.system.cluster.uid }}"
  EOT
}