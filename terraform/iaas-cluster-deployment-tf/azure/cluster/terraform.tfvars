spectrocloud_api_key    =   "j54xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
azure-cloud-account-name  = "azure-palette"
resource_group            = "palette_rg"
cluster_profile           = "tf-azure-profile"
region                    = "eastus"
cluster_ssh_public_key    = "azure-key"
tenant-id               = "0fexxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
client-id               = "bfcxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
client-secret           = "Modxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

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
