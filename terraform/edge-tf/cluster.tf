resource "spectrocloud_cluster_edge_native" "cluster" {
  name              = var.cluster_name
  tags              = var.tags
  depends_on        = [spectrocloud_cluster_profile.profile]

  cluster_profile {
    id = spectrocloud_cluster_profile.profile.id
  }

  cloud_config {
    # Cluster VIP
    vip     = var.sc_vip
    ssh_key = ""
  }

  ##############################
  # master-pool
  ##############################
  machine_pool {
    name                    = "master-pool"
    control_plane           = true
    control_plane_as_worker = true
    additional_labels       = {
      "owner"   = "docs"
      "purpose" = "tutorial"
      "type"    = "master"
    }
    edge_host {
      host_uid  = var.sc_host_one
    }
  }

  ##############################
  # worker-pool
  ##############################
  machine_pool {
    name          = "worker-basic"
    control_plane = false
    additional_labels = {
      "owner"   = "docs"
      "purpose" = "tutorial"
      "type"    = "worker"
    }
    edge_host {
      host_uid  = var.sc_host_two
    }
    edge_host {
      host_uid  = var.sc_host_three
    }      
  }
}