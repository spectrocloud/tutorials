# If looking up a cluster profile instead of creating a new one
# data "spectrocloud_cluster_profile" "profile" {
#   # id = <uid>
#   name = var.cluster_cluster_profile_name
# }

#data "spectrocloud_cloudaccount" "account" {
#  name = var.account_name
#}

data "spectrocloud_pack" "csi" {
  name    = "csi-aws"
  version = "1.0.0"
}

data "spectrocloud_pack" "cni" {
  name    = "cni-calico"
  version = "3.19.0"
}

data "spectrocloud_pack" "k8s" {
  name    = "kubernetes"
  version = "1.21.14"
}

data "spectrocloud_pack" "ubuntu" {
  name    = "ubuntu-aws"
  version = "20.04"
}

data "spectrocloud_pack" "proxy" {
  name = "spectro-proxy"
  version  = "1.2.0"
}

resource "spectrocloud_cluster_profile" "profile" {
  name  = var.cluster_profile
  cloud = var.cloud_name
  type  = "cluster"

  pack {
    name   = data.spectrocloud_pack.ubuntu.name
    tag    = data.spectrocloud_pack.ubuntu.version
    uid    = data.spectrocloud_pack.ubuntu.id
    values = data.spectrocloud_pack.ubuntu.values
  }

  pack {
    name   = data.spectrocloud_pack.k8s.name
    tag    = data.spectrocloud_pack.k8s.version
    uid    = data.spectrocloud_pack.k8s.id
    values = data.spectrocloud_pack.k8s.values
  }

  pack {
    name   = data.spectrocloud_pack.cni.name
    tag    = data.spectrocloud_pack.cni.version
    uid    = data.spectrocloud_pack.cni.id
    values = data.spectrocloud_pack.cni.values
  }

  pack {
    name   = data.spectrocloud_pack.csi.name
    tag    = data.spectrocloud_pack.csi.version
    uid    = data.spectrocloud_pack.csi.id
    values = data.spectrocloud_pack.csi.values
  }

  pack {
    name   = data.spectrocloud_pack.proxy.name
    tag    = data.spectrocloud_pack.proxy.version
    uid    = data.spectrocloud_pack.proxy.id
    values = data.spectrocloud_pack.proxy.values
  }
}

resource "spectrocloud_cluster_profile" "manifest" {
   name        = "manifest"
   description = "application"
   cloud       = "aws"
   type        = "add-on"
  pack {
      name   = "spectro-byo-manifest"
      tag    = "1.0.x"
      uid  = data.manifest.uid
      values = <<-EOT
          manifests:
            byo-manifest:
              contents: |
                apiVersion: v1
                kind: Service
                metadata:
                  name: hello-universe-service
                spec:
                  type: LoadBalancer
                  ports:
                  - protocol: TCP
                    port: 8080
                    targetPort: 8080
                  selector:
                    app: hello-universe
      EOT
    }
}

# # Example of a Basic add-on profile
# resource "spectrocloud_cluster_profile" "cp-addon-vsphere" {
#   name        = "cp-basic"
#   description = "basic cp"
#   cloud       = "vsphere"
#   type        = "add-on"
#   pack {
#     name = "spectro-byo-manifest"
#     tag  = "1.0.x"
#     uid  = "5faad584f244cfe0b98cf489"
#     # layer  = ""
#     values = <<-EOT
#       manifests:
#         byo-manifest:
#           contents: |
#             # Add manifests here
#             apiVersion: v1
#             kind: Namespace
#             metadata:
#               labels:
#                 app: wordpress
#                 app3: wordpress3
#               name: wordpress
#     EOT
#   }
# }
