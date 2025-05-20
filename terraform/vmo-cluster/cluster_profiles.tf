
##########################
# MAAS VMO Cluster Profile
##########################
resource "spectrocloud_cluster_profile" "maas-vmo-profile" {
  count = var.deploy-maas ? 1 : 0

  name        = var.vmo-cluster-name
  description = "A basic cluster profile for MAAS VMO"
  tags        = concat(var.tags, ["env:maas"])
  cloud       = "maas"
  type        = var.cluster-profile-type
  version     = var.cluster-profile-version

  pack {
    name   = data.spectrocloud_pack.maas_ubuntu.name
    tag    = data.spectrocloud_pack.maas_ubuntu.version
    uid    = data.spectrocloud_pack.maas_ubuntu.id
    values = file("manifests/ubuntu-values.yaml")
    type   = "spectro"
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
    name = data.spectrocloud_pack.maas_csi.name
    tag  = data.spectrocloud_pack.maas_csi.version
    uid  = data.spectrocloud_pack.maas_csi.id
    values = templatefile("manifests/csi-values.yaml", {
      worker_nodes = var.maas-worker-nodes,
    })
    type = "spectro"
  }

  pack {
    name   = "lb-metallb-helm"
    tag    = "1.14.x"
    uid    = data.spectrocloud_pack.maas_metallb.id
    values = file("manifests/metallb-values.yaml")
  }
  
  pack {
    name   = data.spectrocloud_pack.maas_vmo.name
    tag    = data.spectrocloud_pack.maas_vmo.version
    uid    = data.spectrocloud_pack.maas_vmo.id
    values = file("manifests/vmo-values.yaml")
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
