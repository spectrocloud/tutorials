# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

#########
# Palette
#########

variable "palette-project" {
  type        = string
  description = "The name of your project in Palette."

  validation {
    condition     = var.palette-project != ""
    error_message = "Provide the correct Palette project."
  }

}

#######
# AWS
#######
variable "aws-cloud-account-name" {
  type        = string
  description = "The name of your AWS account as assigned in Palette."

  validation {
    condition     = var.deploy-aws ? var.aws-cloud-account-name != "REPLACE ME" && var.aws-cloud-account-name != "" : true
    error_message = "Provide the correct AWS cloud account name."
  }
}

variable "deploy-aws" {
  type        = bool
  description = "A flag for enabling a deployment on AWS."
}

variable "deploy-aws-var" {
  type        = bool
  description = "A flag for enabling a deployment on AWS with Kubecost."
}

variable "aws-region" {
  type        = string
  description = "AWS region"
  default     = "us-east-2"

  validation {
    condition     = var.deploy-aws ? var.aws-region != "REPLACE ME" && var.aws-region != "" : true
    error_message = "Provide the correct AWS region."
  }
}

variable "aws-key-pair-name" {
  type        = string
  description = "The name of the AWS key pair to use for SSH access to the cluster."

  validation {
    condition     = var.deploy-aws ? var.aws-key-pair-name != "REPLACE ME" && var.aws-key-pair-name != "" : true
    error_message = "Provide the correct AWS SSH key pair name."
  }
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
    availability_zones = ["us-east-2a"]
  }
  description = "AWS control plane nodes configuration."

  validation {
    condition     = var.deploy-aws ? length(var.aws_control_plane_nodes.availability_zones) > 0 && !contains(var.aws_control_plane_nodes.availability_zones, "REPLACE ME") : true
    error_message = "The availability_zones parameter must be set correctly"
  }
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
    availability_zones = ["us-east-2a"]
  }
  description = "AWS worker nodes configuration."

  validation {
    condition     = var.deploy-aws ? length(var.aws_worker_nodes.availability_zones) > 0 && !contains(var.aws_worker_nodes.availability_zones, "REPLACE ME") : true
    error_message = "The availability_zones parameter must be set correctly"
  }
}

#######
# Azure
#######
variable "azure-cloud-account-name" {
  type        = string
  description = "The name of your Azure account as assigned in Palette."
  default     = ""

  validation {
    condition     = var.deploy-azure ? var.azure-cloud-account-name != "REPLACE ME" && var.azure-cloud-account-name != "" : true
    error_message = "Provide the correct Azure cloud account name."
  }
}

variable "deploy-azure" {
  type        = bool
  description = "A flag for enabling a deployment on Azure."
}

variable "deploy-azure-kubecost" {
  type        = bool
  description = "A flag for enabling a deployment on Azure with Kubecost."
}

variable "azure_subscription_id" {
  type        = string
  description = "Azure subscription ID."
  default     = ""

  validation {
    condition     = var.deploy-azure ? var.azure_subscription_id != "REPLACE ME" && var.azure_subscription_id != "" : true
    error_message = "Provide the correct Azure subscription ID."
  }
}

variable "azure_resource_group" {
  type        = string
  description = "Azure resource group."
  default     = ""

  validation {
    condition     = var.deploy-azure ? var.azure_resource_group != "REPLACE ME" && var.azure_resource_group != "" : true
    error_message = "Provide the correct Azure resource group name."
  }
}

variable "azure-use-azs" {
  type        = bool
  description = "A flag for configuring whether to use Azure Availability Zones. Check if your Azure region supports availability zones by reviewing the [Azure Regions and Availability Zones](https://learn.microsoft.com/en-us/azure/reliability/availability-zones-service-support#azure-regions-with-availability-zone-support) resource."
}

variable "azure-region" {
  type        = string
  description = "Azure region."
  default     = "eastus"

  validation {
    condition     = var.deploy-azure ? var.azure-region != "REPLACE ME" && var.azure-region != "" : true
    error_message = "Provide the correct Azure region name."
  }
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

  validation {
    condition     = var.deploy-gcp ? var.gcp-cloud-account-name != "REPLACE ME" && var.gcp-cloud-account-name != "" : true
    error_message = "Provide the correct GCP cloud account name."
  }
}

variable "gcp_project_name" {
  type        = string
  description = "The name of your GCP project."
  default     = ""

  validation {
    condition     = var.deploy-gcp ? var.gcp_project_name != "REPLACE ME" && var.gcp_project_name != "" : true
    error_message = "Provide the correct GCP project name."
  }
}

variable "deploy-gcp" {
  type        = bool
  description = "A flag for enabling a deployment on GCP."
}

variable "deploy-gcp-kubecost" {
  type        = bool
  description = "A flag for enabling a deployment on GCP with Kubecost."
}

variable "gcp-region" {
  type        = string
  description = "GCP region"
  default     = "us-central1"

  validation {
    condition     = var.deploy-gcp ? var.gcp-region != "REPLACE ME" && var.gcp-region != "" : true
    error_message = "Provide the correct GCP region."
  }
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

  validation {
    condition     = var.deploy-gcp ? length(var.gcp_control_plane_nodes.availability_zones) > 0 && !contains(var.gcp_control_plane_nodes.availability_zones, "REPLACE ME") : true
    error_message = "The availability_zones parameter must be set correctly"
  }
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

  validation {
    condition     = var.deploy-gcp ? length(var.gcp_worker_nodes.availability_zones) > 0 && !contains(var.gcp_worker_nodes.availability_zones, "REPLACE ME") : true
    error_message = "The availability_zones parameter must be set correctly"
  }
}

variable "tags" {
  type        = list(string)
  description = "The default tags to apply to Palette resources."
  default = [
    "spectro-cloud-education",
    "app:hello-universe",
    "spectrocloud:tutorials",
    "terraform_managed:true",
    "tutorial:getting-started-terraform"
  ]
}

  variable "replicaCount" {
    type        = number
    description = "The number of pods to be created."
}

variable "wordpress_namespace" {
  type        = string
  description = "The Wordpress Namespace needs to be set."
  sensitive   = true

validation {
    condition     = var.deploy-aws || var.deploy-azure || var.deploy-gcp ? var.wordpress_namespace != "REPLACE ME" && var.wordpress_namespace != "" : true
    error_message = "Provide the namespace for Wordpress."
  }

}

variable "wordpress_port" {
  type        = number
  description = "The password to use for Wordpress."
  sensitive   = true

}



