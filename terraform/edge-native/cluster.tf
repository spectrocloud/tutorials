module "edge-demo-module" {
  source  = "spectrocloud/edge/spectrocloud"
  version = "1.2.0"
  # Store Number/Location
  name = "demo"
  # add tags to the cluster (optional) list(strings)
  cluster_tags = ["origin:terraform"]

  # Cluster VIP to be used with KubeVIP
  cluster_vip = "10.100.100.32"

  # Node Pools for Cluster
  machine_pools = [
    # Control Plane Node Pool
    {
      name                    = "control-plane"
      control_plane           = true
      control_plane_as_worker = false
      additional_labels = {
        "region" : "east"
      }
      edge_host = [
        {
          host_uid  = "edge-d83a7e13ebdd99de453d48210b330b96"
          static_ip = "10.100.100.31"
        }
      ]
    },
    # Add additional node pools
    {
      name          = "gpu"
      control_plane = false
      edge_host = [

        {
          host_uid  = "123test"
          static_ip = "2.2.2.2"
        }
      ]
      additional_labels = {
        "type" : "gpu",
        "region" : "east"
      }
    }

  ]

  # Profiles to be added Profile should be an Edge-Native Infra or Full Profile with the OS, Kubernetes Distribution and CNI of choice
  cluster_profiles = [
    {
      name    = "ubuntu-k3s"
      tag     = "1.24.6"
      context = "project"
    },
    {
      name    = "edge-services"
      tag     = "1.0.0"
      context = "project"
    },
    {
      name    = "kubevirt"
      tag     = "1.0.0"
      context = "project"
    },
  ]
  # Cluster Geolocation (Optional)
  location = {
    latitude  = 40.442829
    longitude = -79.950432
  }
  rbac_bindings = [
    {
      rbac_type = "ClusterRoleBinding"
      rbac_role = {
        name = "cluster-admin"
        kind = "ClusterRole"
      }
      subjects = [
        {
          name      = "k8s-admin"
          rbac_type = "Group"
        }
      ]
    }
  ]

}
