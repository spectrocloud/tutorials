variable "region" {}
variable "aws-cloud-account-name" {
    type = string
    description = "The name of your AWS account as assigned in Palette"
}
variable "master_nodes" {
    type = object({
        count           = string
        instance_type   = string
        disk_size_gb    = string
        availability_zones = list(string)
    })
    description = "Master nodes configuration."
}
variable "worker_nodes" {
    type = object({
        count           = string
        instance_type   = string
        disk_size_gb    = string
        availability_zones = list(string)
    })
    description = "Worker nodes configuration."
}

variable ssh_key_name {}
variable ssh_public_key {}
variable "aws_access_key" {}
variable "aws_secret_access_key" {
  sensitive    = true
}