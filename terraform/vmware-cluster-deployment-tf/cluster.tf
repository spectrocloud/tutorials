# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

resource "spectrocloud_cluster_vsphere" "cluster" {
  name             = var.cluster_name
  tags             = var.tags
  cloud_account_id = data.spectrocloud_cloudaccount_vsphere.account.id
  depends_on       = [spectrocloud_cluster_profile.profile]

  cloud_config {
    ssh_key    = local.ssh_public_key
    datacenter = var.datacenter_name
    folder     = var.folder_name
    static_ip  = true

  }

  cluster_profile {
    id = spectrocloud_cluster_profile.profile.id
  }

  scan_policy {
    configuration_scan_schedule = "0 0 * * SUN"
    penetration_scan_schedule   = "0 0 * * SUN"
    conformance_scan_schedule   = "0 0 1 * *"
  }

  ##############################
  # control-plane-pool
  ##############################
  machine_pool {
    name                    = "control-plane-pool"
    count                   = 1
    control_plane           = true
    control_plane_as_worker = true

    instance_type {
      cpu          = 4
      disk_size_gb = 60
      memory_mb    = 8000
    }

    placement {
      cluster           = var.vsphere_cluster
      datastore         = var.datastore_name
      network           = var.network_name
      resource_pool     = var.resource_pool_name
      static_ip_pool_id = resource.spectrocloud_privatecloudgateway_ippool.ippool.id
    }

    additional_labels = {
      "owner"   = "docs"
      "purpose" = "tutorial"
      "type"    = "control-plane-node"
    }
  }

  ##############################
  # worker-pool
  ##############################
  machine_pool {
    name          = "worker-pool"
    count         = 1
    control_plane = false

    instance_type {
      cpu          = 4
      disk_size_gb = 60
      memory_mb    = 8000
    }

    placement {
      cluster           = var.vsphere_cluster
      datastore         = var.datastore_name
      network           = var.network_name
      resource_pool     = var.resource_pool_name
      static_ip_pool_id = resource.spectrocloud_privatecloudgateway_ippool.ippool.id
    }

    additional_labels = {
      "owner"   = "docs"
      "purpose" = "tutorial"
      "type"    = "worker-node"
    }
  }

}
