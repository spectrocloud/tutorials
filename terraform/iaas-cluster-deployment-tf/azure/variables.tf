variable "subscription_id" {}
variable "tenant_id" {}
variable client-id {}
variable client-secret {} 
variable "resource_group" {}
variable "region" {}
variable ssh_key_name {}
variable ssh_public_key {}

variable "azure-cloud-account-name" {
    type = string
    description = "The name of your Azure account as assigned in Palette"
}

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