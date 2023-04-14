data "spectrocloud_cloudaccount_azure" "account" {
  name = var.azure-cloud-account-name
}

resource "spectrocloud_cluster_azure" "cluster" {
  name             = "azure-cluster"
  tags             = ["ms-azure", "tutorial"]
  cloud_account_id = data.spectrocloud_cloudaccount_azure.account.id

  cloud_config {
    subscription_id = var.subscription_id
    resource_group  = var.resource_group
    region          = var.region
    ssh_key         = azurerm_ssh_public_key.tutorial-key.name
  }

  cluster_profile {
    id = spectrocloud_cluster_profile.profile.name
  }

  machine_pool {
    control_plane           = true
    control_plane_as_worker = true
    name                    = "master-pool"
    count                   = var.master_nodes.count
    instance_type           = var.master_nodes.instance_type
    azs                     = var.master_nodes.availability_zones
    is_system_node_pool     = var.master_nodes.is_system_node_pool
    disk {
      size_gb = var.master_nodes.disk_size_gb
      type    = "Standard_LRS"
    }
  }

  machine_pool {
    name                 = "worker-basic"
    count                = var.worker_nodes.count
    instance_type        = var.worker_nodes.instance_type
    azs                  = var.worker_nodes.availability_zones
    is_system_node_pool  = var.worker_nodes.is_system_node_pool
  }
}