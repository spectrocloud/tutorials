# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

################
# MAAS Cluster
################

resource "spectrocloud_cluster_maas" "maas-cluster" {
  count = var.deploy-maas ? 1 : 0

  name                 = "vmo-cluster-maas"
  tags                 = concat(var.tags, ["env:maas"])
  cloud_account_id     = data.spectrocloud_cloudaccount_maas.account[0].id
  pause_agent_upgrades = "unlock"

  cloud_config {
    domain = var.maas-domain
  }

  cluster_profile {
    id = resource.spectrocloud_cluster_profile.maas-vmo-profile[0].id
  }

  machine_pool {
    name          = "maas-control-plane"
    count         = 1
    control_plane = true
    azs           = var.maas-control-plane-azs
    node_tags     = var.maas-control-plane-node-tags
    instance_type {
      min_cpu       = 8
      min_memory_mb = 16000
    }
    placement {
      resource_pool = var.maas-control-plane-resource-pool
    }
  }

  machine_pool {
    name      = "maas-worker-basic"
    count     = 1
    azs       = var.maas-worker-azs
    node_tags = var.maas-worker-node-tags
    instance_type {
      min_cpu       = 8
      min_memory_mb = 32000
    }
    placement {
      resource_pool = var.maas-worker-resource-pool
    }
  }
}
