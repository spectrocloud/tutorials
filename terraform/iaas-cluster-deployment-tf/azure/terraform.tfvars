azure-cloud-account-name  = "<your azure account>"
resource_group            = "<your resource group>"
region                    = "eastus"

subscription_id           = "<your subscription id>"
tenant_id                 = "<your tenant id>" 
client-id                 = "<your client id>" 
client-secret             = "<your client secret>" 
ssh_key_name              = "ssh-key" 
ssh_public_key            = "<your public key>" 

master_nodes = {
    count            = "1"
    instance_type    = "Standard_A2_v2"
    disk_size_gb     = "60"
    availability_zones = []
    is_system_node_pool = false
}

worker_nodes = {
    count            = "1"
    instance_type    = "Standard_A2_v2"
    disk_size_gb     = "60"
    availability_zones = []
    is_system_node_pool = false
}
