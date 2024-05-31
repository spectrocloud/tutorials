# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

#######
# AWS
#######
variable "aws-cloud-account-name" {
  type        = string
  description = "The name of your AWS account as assigned in Palette."
  default     = ""
}

variable "deploy-aws" {
  type        = bool
  description = "A flag for enabling a deployment on AWS."
}

variable "deploy-aws-new" {
  type        = bool
  description = "A flag for enabling a deployment on AWS with Kubecost."
}

variable "aws-region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "aws-key-pair-name" {
  type        = string
  description = "The name of the AWS key pair to use for SSH access to the cluster."
  default     = ""
}

variable "aws_control_plane_nodes" {
  type = object({
    count              = string
    control_plane      = bool
    instance_type      = string
    disk_size_gb       = string
    availability_zones = list(string)
  })
  default = {
    count              = "1"
    control_plane      = true
    instance_type      = "m4.2xlarge"
    disk_size_gb       = "60"
    availability_zones = ["us-east-1a"]
  }
  description = "AWS control plane nodes configuration."
}
variable "aws_worker_nodes" {
  type = object({
    count              = string
    control_plane      = bool
    instance_type      = string
    disk_size_gb       = string
    availability_zones = list(string)
  })
  default = {
    count              = "1"
    control_plane      = false
    instance_type      = "m4.2xlarge"
    disk_size_gb       = "60"
    availability_zones = ["us-east-1a"]
  }
  description = "AWS worker nodes configuration."
}

#######
# Azure
#######
variable "azure-cloud-account-name" {
  type        = string
  description = "The name of your Azure account as assigned in Palette."
  default     = ""
}

variable "deploy-azure" {
  type        = bool
  description = "A flag for enabling a deployment on Azure."
}

variable "deploy-azure-new" {
  type        = bool
  description = "A flag for enabling a deployment on Azure with Kubecost."
}

variable "azure_subscription_id" {
  type        = string
  description = "Azure subscription ID."
  default     = ""
}

variable "azure_resource_group" {
  type        = string
  description = "Azure resource group."
  default     = ""
}

variable "azure-use-azs" {
  type        = bool
  description = "A flag for configuring whether to use Azure Availability Zones. Check if your Azure region supports availability zones by reviewing the [Azure Regions and Availability Zones](https://learn.microsoft.com/en-us/azure/reliability/availability-zones-service-support#azure-regions-with-availability-zone-support) resource."
}

variable "azure-region" {
  type        = string
  description = "Azure region."
  default     = "eastus"
}

variable "azure_control_plane_nodes" {
  type = object({
    count               = string
    control_plane       = bool
    instance_type       = string
    disk_size_gb        = string
    azs                 = list(string)
    is_system_node_pool = bool
  })
  default = {
    count         = "1"
    control_plane = true
    instance_type = "Standard_A8_v2"
    disk_size_gb  = "60"
    azs           = ["1"]
  is_system_node_pool = false }
  description = "Azure control plane nodes configuration."
}

variable "azure_worker_nodes" {
  type = object({
    count               = string
    control_plane       = bool
    instance_type       = string
    disk_size_gb        = string
    azs                 = list(string)
    is_system_node_pool = bool
  })
  default = {
    count         = "1"
    control_plane = false
    instance_type = "Standard_A8_v2"
    disk_size_gb  = "60"
    azs           = ["1"]
  is_system_node_pool = false }
  description = "Azure worker nodes configuration."
}

#######
# GCP
#######
variable "gcp-cloud-account-name" {
  type        = string
  description = "The name of your GCP account as assigned in Palette."
  default     = ""
}

variable "gcp_project_name" {
  type        = string
  description = "The name of your GCP project."
  default     = ""
}

variable "deploy-gcp" {
  type        = bool
  description = "A flag for enabling a deployment on GCP."
}

variable "deploy-gcp-new" {
  type        = bool
  description = "A flag for enabling a deployment on GCP with Kubecost."
}

variable "gcp-region" {
  type        = string
  description = "GCP region"
  default     = "us-central1"
}

variable "gcp_control_plane_nodes" {
  type = object({
    count              = string
    control_plane      = bool
    instance_type      = string
    disk_size_gb       = string
    availability_zones = list(string)
  })
  default = {
    count         = "1"
    control_plane = true
    instance_type = "n1-standard-4"
    disk_size_gb  = "60"
  availability_zones = ["us-central1-a"] }
  description = "GCP control plane nodes configuration."
}

variable "gcp_worker_nodes" {
  type = object({
    count              = string
    control_plane      = bool
    instance_type      = string
    disk_size_gb       = string
    availability_zones = list(string)
  })
  default = {
    count         = "1"
    control_plane = false
    instance_type = "n1-standard-4"
    disk_size_gb  = "60"
  availability_zones = ["us-central1-a"] }
  description = "GCP worker nodes configuration."
}

variable "tags" {
  type        = list(string)
  description = "The default tags to apply to Palette resources."
  default = [
    "spectro-cloud-education",
    "app:hello-universe",
    "repository:spectrocloud:tutorials",
    "terraform_managed:true",
    "tutorial:getting-started-terraform"
  ]
}


########
# VMware
########

variable "deploy-vmware" {
  type        = bool
  description = "A flag for enabling a deployment on VMware."
}

variable "deploy-vmware-new" {
  type        = bool
  description = "A flag for enabling a deployment on VMware with Kubecost."
}

variable "metallb_ip" {
  type        = string
  description = "The IP address range for your MetalLB load balancer."
}

variable "ssh_key" {
  type        = string
  description = "The path to the public key that will be added to the cluster nodes. If not provided, a new key pair will be generated."

  validation {
    condition     = var.ssh_key == "" ? true : fileexists(var.ssh_key)
    error_message = "The provided SSH key file does not exist. Please, provide a valid path."
  }
}

variable "ssh_key_private" {
  type        = string
  description = "The path to the private key that will be used to access the cluster nodes. If not provided, a new key pair will be generated."

  validation {
    condition     = var.ssh_key_private == "" ? true : fileexists(var.ssh_key_private)
    error_message = "The provided SSH key file does not exist. Please, provide a valid path."
  }
}

variable "datacenter_name" {
  type        = string
  description = "The name of the datacenter in vSphere.."
}

variable "folder_name" {
  type        = string
  description = "The name of the folder in vSphere."
}

variable "search_domain" {
  type        = string
  description = "The name of network search domain."
}

# Input resources for the cluster - Placement
variable "vsphere_cluster" {
  type        = string
  description = "The name of your vSphere cluster."
}

variable "datastore_name" {
  type        = string
  description = "The name of the vSphere datastore."
}

variable "network_name" {
  type        = string
  description = "The name of the vSphere network."
}

variable "resource_pool_name" {
  type        = string
  description = "The name of the vSphere resource pool."
}

variable "pcg_name" {
  type        = string
  description = "The name of the PCG that will be used to deploy the cluster."
}

# Input resources for the Static IP Pool (required for static IP placement)
# variable "network_gateway" {
#   type        = string
#   description = "The IP address of the vSphere network gateway."
# }

# variable "network_prefix" {
#   type        = number
#   description = "The prefix of your vSphere network. Valid values are network CIDR subnet masks from the range 0-32. Example: 18."
# }

# variable "ip_range_start" {
#   type        = string
#   description = "The first IP address of your PCG IP pool range."
# }

# variable "ip_range_end" {
#   type        = string
#   description = "The last IP address of your PCG IP pool range."
# }

# variable "nameserver_addr" {
#   type        = set(string)
#   description = "A comma-separated list of DNS nameserver IP addresses of your network."
# }


##############################
# Hello Universe App Variables
##############################
variable "app_namespace" {
  type        = string
  description = "The namespace in which the application will be deployed."
}

variable "app_port" {
  type        = number
  description = "The cluster port number on which the service will listen for incoming traffic."
}

variable "replicas_number" {
  type        = number
  description = "The number of pods to be created."
}

variable "db_password" {
  type        = string
  description = "The base64 encoded database password to connect to the API database."
}

variable "auth_token" {
  type        = string
  description = "The base64 encoded auth token for the API connection."
}