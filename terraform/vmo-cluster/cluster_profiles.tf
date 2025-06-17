##########################
# MAAS VMO Cluster Profile
##########################
resource "spectrocloud_cluster_profile" "maas-vmo-profile" {
  count = var.deploy-maas ? 1 : 0

  name        = "tf-maas-vmo-profile"
  description = "A basic cluster profile for MAAS VMO"
  tags        = concat(var.tags, ["env:maas"])
  cloud       = "maas"
  type        = "cluster"
  version     = "1.0.0"

  pack {
    name = data.spectrocloud_pack.maas_ubuntu.name
    tag  = data.spectrocloud_pack.maas_ubuntu.version
    uid  = data.spectrocloud_pack.maas_ubuntu.id
    values = templatefile("manifests/ubuntu-values.yaml", {
      node-network = var.node-network
    })
    type = "spectro"
  }

  pack {
    name   = data.spectrocloud_pack.maas_k8s.name
    tag    = data.spectrocloud_pack.maas_k8s.version
    uid    = data.spectrocloud_pack.maas_k8s.id
    values = file("manifests/k8s-values.yaml")
    type   = "spectro"
  }

  pack {
    name   = data.spectrocloud_pack.maas_cni.name
    tag    = data.spectrocloud_pack.maas_cni.version
    uid    = data.spectrocloud_pack.maas_cni.id
    values = file("manifests/cni-values.yaml")
    type   = "spectro"
  }

  pack {
    name   = data.spectrocloud_pack.maas_csi.name
    tag    = data.spectrocloud_pack.maas_csi.version
    uid    = data.spectrocloud_pack.maas_csi.id
    values = file("manifests/csi-values.yaml")
    type   = "spectro"
  }

  pack {
    name = data.spectrocloud_pack.maas_metallb.name
    tag  = data.spectrocloud_pack.maas_metallb.version
    uid  = data.spectrocloud_pack.maas_metallb.id
    values = templatefile("manifests/metallb-values.yaml", {
      metallb-ip-pool = var.metallb-ip-pool
    })
    type = "spectro"
  }

  pack {
    name = data.spectrocloud_pack.maas_vmo.name
    tag  = data.spectrocloud_pack.maas_vmo.version
    uid  = data.spectrocloud_pack.maas_vmo.id
    values = templatefile("manifests/vmo-values.yaml", {
      vmo-network-interface = var.vmo-network-interface,
      vm-vlans              = var.vm-vlans,
      host-vlans            = var.host-vlans
    })
    type = "spectro"
  }

  pack {
    name   = "vmo-extras"
    type   = "manifest"
    tag    = "1.0.0"
    values = file("manifests/vmo-extras-values.yaml")
    manifest {
      name = "vmo-extras"
      content = templatefile("manifests/vmo-extras-manifest.yaml", {
        palette-user-id = var.palette-user-id
      })
    }
  }
}