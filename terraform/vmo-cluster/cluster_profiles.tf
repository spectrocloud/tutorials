
##########################
# MAAS VMO Cluster Profile
##########################
resource "spectrocloud_cluster_profile" "maas-vmo-profile" {
  count = var.deploy-maas ? 1 : 0

  name        = "tf-maas-vmo-profile"
  description = "A basic cluster profile for MAAS VMO"
  tags        = concat(var.tags, ["env:maas"])
  cloud       = "maas"
  type        = var.clusterProfileType # "cluster"
  version     = var.clusterProfileVersion

  pack {
    name   = data.spectrocloud_pack.maas_ubuntu.name
    tag    = data.spectrocloud_pack.maas_ubuntu.version
    uid    = data.spectrocloud_pack.maas_ubuntu.id
    values = templatefile("manifests/ubuntu-values.yaml", {
      maas-host-cidr = var.maas-host-cidr
    })
    type   = "spectro"
  }

  pack {
    name   = data.spectrocloud_pack.maas_k8s.name
    tag    = data.spectrocloud_pack.maas_k8s.version
    uid    = data.spectrocloud_pack.maas_k8s.id
    values = templatefile("manifests/k8s-values.yaml", {
      pod-cidr = var.pod-cidr,
      clusterServicesCIDR = var.clusterServicesCIDR
    type   = "spectro"
  })
  }

  pack {
    name   = data.spectrocloud_pack.maas_cni.name
    tag    = data.spectrocloud_pack.maas_cni.version
    uid    = data.spectrocloud_pack.maas_cni.id
    values = file("manifests/cni-values.yaml")
    type   = "spectro"
  }

  pack {
    name = data.spectrocloud_pack.maas_csi.name
    tag  = data.spectrocloud_pack.maas_csi.version
    uid  = data.spectrocloud_pack.maas_csi.id
    values = templatefile("manifests/csi-values.yaml", {
      worker_nodes = var.maas-worker-nodes
    })
    type = "spectro"
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
    name   = data.spectrocloud_pack.maas_vmo.name
    tag    = data.spectrocloud_pack.maas_vmo.version
    uid    = data.spectrocloud_pack.maas_vmo.id
    values = templatefile("manifests/vmo-values.yaml", {
      network-bridge = var.vmo-network-interface,
      vm-vlans = var.vm-vlans,
      host-vlans = var.host-vlans
    })
    type   = "spectro"
  }

  pack {
    name   = "vmo-extras"
    type   = "manifest"
    tag    = "1.0.0"
    values = file("manifests/vmo-extras-values.yaml")
    manifest {
      name    = "vmo-extras"
      content = file("manifests/vmo-extras-manifest.yaml")
    }
  }

}
