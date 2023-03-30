variable "spectrocloud_api_key" {}
variable "subscription_id" {}
variable "resource_group" {}
variable "region" {}
variable "cluster_ssh_public_key" {}
variable "cluster_profile" {}

variable "azure-cloud-account-name" {
    type = string
    description = "The name of your Azure account as assigned in Palette"
}
variable "azure_tenant_id" {}
variable "azure_client_id" {}
variable "azure_client_secret" {}

variable "master_nodes" {
    type = object({
        count               = string
        instance_type       = string
        disk_size_gb        = string
        availability_zones  = list(string)
        is_system_node_pool = bool
    })
    description = "Master nodes configuration."
}

variable "worker_nodes" {
    type = object({
        count           = string
        instance_type   = string
        disk_size_gb    = string
        availability_zones = list(string)
        is_system_node_pool = bool
    })
    description = "Worker nodes configuration."
}
