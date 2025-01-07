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

######################
# Common Configuration
######################

variable "tags" {
  type        = list(string)
  description = "The default tags to apply to Palette resources."
  default = [
    "spectro-cloud-education",
    "spectrocloud:tutorials",
    "terraform_managed:true",
    "tutorial:vmo-cluster-deployment"
  ]
}

######
# MAAS
######

variable "deploy-maas" {
  type        = bool
  description = "A flag for enabling a deployment on MAAS."
}

variable "deploy-maas-vm" {
  type        = bool
  description = "A flag for enabling a VM creation on the MAAS cluster."
}

variable "pcg-name" {
  type        = string
  description = "The name of the PCG that will be used to deploy the cluster."

  validation {
    condition     = var.deploy-maas ? var.pcg-name != "REPLACE ME" && var.pcg-name != "" : true
    error_message = "Provide the correct MAAS PCG name."
  }
}

variable "maas-domain" {
  type        = string
  description = "MAAS domain"

  validation {
    condition     = var.deploy-maas ? var.maas-domain != "REPLACE ME" && var.maas-domain != "" : true
    error_message = "Provide the correct MAAS domain."
  }
}

variable "maas-worker-nodes" {
  type        = number
  description = "Number of MaaS worker nodes"
  default     = 1

  validation {
    condition     = var.deploy-maas ? var.maas-worker-nodes > 0 : true
    error_message = "Provide a valid number of worker nodes."
  }
}

variable "maas-worker-resource-pool" {
  type        = string
  description = "Resource pool for the MAAS worker nodes."

  validation {
    condition     = var.deploy-maas ? var.maas-worker-resource-pool != "REPLACE ME" && var.maas-worker-resource-pool != "" : true
    error_message = "Provide a valid resource pool for worker nodes."
  }
}

variable "maas-worker-azs" {
  type        = set(string)
  description = "Set of AZs for the MAAS worker nodes."

  validation {
    condition     = var.deploy-maas ? !contains(var.maas-worker-azs, "REPLACE ME") && length(var.maas-worker-azs) != 0 : true
    error_message = "Provide a valid set of AZs for worker nodes."
  }
}

variable "maas-worker-node-tags" {
  type        = set(string)
  description = "Set of node tags for the MAAS worker nodes."

  validation {
    condition     = var.deploy-maas ? !contains(var.maas-worker-node-tags, "REPLACE ME") && length(var.maas-worker-node-tags) != 0 : true
    error_message = "Provide a valid set of node tags for worker nodes."
  }
}

variable "maas-control-plane-nodes" {
  type        = number
  description = "Number of MaaS control plane nodes"
  default     = 1

  validation {
    condition     = var.deploy-maas ? var.maas-control-plane-nodes > 0 : true
    error_message = "Provide a valid number of control plane nodes."
  }
}

variable "maas-control-plane-resource-pool" {
  type        = string
  description = "Resource pool for the MAAS control plane nodes."

  validation {
    condition     = var.deploy-maas ? var.maas-control-plane-resource-pool != "REPLACE ME" && var.maas-control-plane-resource-pool != "" : true
    error_message = "Provide a valid resource pool for worker nodes."
  }
}

variable "maas-control-plane-azs" {
  type        = set(string)
  description = "Set of AZs for the MAAS control plane nodes."

  validation {
    condition     = var.deploy-maas ? !contains(var.maas-control-plane-azs, "REPLACE ME") && length(var.maas-control-plane-azs) != 0 : true
    error_message = "Provide a valid set of AZs for control plane nodes."
  }
}

variable "maas-control-plane-node-tags" {
  type        = set(string)
  description = "Set of node tags for the MAAS control plane nodes."

  validation {
    condition     = var.deploy-maas ? !contains(var.maas-control-plane-node-tags, "REPLACE ME") && length(var.maas-control-plane-node-tags) != 0 : true
    error_message = "Provide a valid set of node tags for control plane nodes."
  }
}
