spectrocloud_api_key    = "j54AsdjnSP2YU9jJF1K5dVYeURWzO4qd"
azure-cloud-account-name  = "azure-palette"
subscription_id         = "03a79db3-46f0-4cd0-96cb-d50689f56eaa"
resource_group          = "palette_rg"
cluster_profile         = "tf-azure-profile"
region                  = "eastus"
cluster_ssh_public_key  = "azure-key"

master_nodes = {
    count            = "1"
    instance_type    = "Standard_A2_v2"
    disk_size_gb     = "60"
    availability_zones = []
    is_system_node_pool = false
}

worker_nodes = {
    count            = "2"
    instance_type    = "Standard_A2_v2"
    disk_size_gb     = "60"
    availability_zones = []
    is_system_node_pool = false
}
