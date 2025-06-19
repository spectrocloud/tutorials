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
    error_message = "Provide a Palette project name."
  }
}

variable "palette-user-id" {
  type        = string
  description = "The name of your project in Palette."

  validation {
    condition     = var.palette-user-id != ""
    error_message = "Please provide a Palette user ID."
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

#########################
# clusters.tf
#########################

variable "maas-control-node-min-cpu" {
  type        = number
  description = "Minimum number of CPU cores allocated to the Control Plane node."
  default = 8

  validation {
    condition     = var.deploy-maas ? var.maas-control-node-min-cpu > 0 : true
    error_message = "Provide a valid number of cores for your Control Plane node."
  }
}

variable "maas-control-node-min-memory-mb" {
  type        = number
  description = "Minimum amount of RAM allocated to the Control Plane node."
  default = 32

  validation {
    condition     = var.deploy-maas ? var.maas-control-node-min-memory-mb > 0 : true
    error_message = "Provide a valid amount of RAM (MB) for your Control Plane node."
  }
}

variable "maas-worker-node-min-cpu" {
  type        = number
  description = "Minimum number of CPU cores allocated to the worker node."
  default = 8

  validation {
    condition     = var.deploy-maas ? var.maas-worker-node-min-cpu > 0 : true
    error_message = "Provide a valid number of CPU cores for your worker node."
  }
}

variable "maas-worker-node-min-memory-mb" {
  type        = number
  description = "Minimum amount of RAM allocated to the worker node."
  default = 32

  validation {
    condition     = var.deploy-maas ? var.maas-worker-node-min-memory-mb > 0 : true
    error_message = "Provide a valid amount of RAM (MB) for your worker node."
  }
}

variable "vmo-cluster-name" {
  type        = string
  description = "The name of the cluster."
  default     = "vmo-tutorial-cluster"

  validation {
    condition     = var.deploy-maas ? var.vmo-cluster-name != "REPLACE ME" && var.vmo-cluster-name != "" : true
    error_message = "Provide the correct MAAS PCG name."
  }
}

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
    error_message = "Provide a valid MAAS PCG name."
  }
}

variable "maas-domain" {
  type        = string
  description = "The name of the MAAS domain."

  validation {
    condition     = var.deploy-maas ? var.maas-domain != "REPLACE ME" && var.maas-domain != "" : true
    error_message = "Provide a valid MAAS domain."
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

variable "maas-control-plane-resource-pool" {
  type        = string
  description = "Resource pool for the MAAS control plane nodes."

  validation {
    condition     = var.deploy-maas ? var.maas-control-plane-resource-pool != "REPLACE ME" && var.maas-control-plane-resource-pool != "" : true
    error_message = "Provide a valid resource pool for MAAS control plane nodes."
  }
}

variable "maas-control-plane-azs" {
  type        = set(string)
  description = "Set of AZs for the MAAS control plane nodes."

  validation {
    condition     = var.deploy-maas ? !contains(var.maas-control-plane-azs, "REPLACE ME") && length(var.maas-control-plane-azs) != 0 : true
    error_message = "Provide a valid set of AZs for MAAS control plane nodes."
  }
}

variable "maas-control-plane-node-tags" {
  type        = set(string)
  description = "Set of node tags for the MAAS control plane nodes."

  validation {
    condition     = var.deploy-maas ? !contains(var.maas-control-plane-node-tags, "REPLACE ME") && length(var.maas-control-plane-node-tags) != 0 : true
    error_message = "Provide a valid set of node tags for MAAS control plane nodes."
  }
}

################################
# /manifests/metallb-values.yaml
################################

variable "metallb-ip-pool" {
  type        = string
  description = "CIDR notation subnets or IP range for MetalLb. For example, 192.168.1.0/24 or 192.168.1.0-192.168.1.255."

  validation {
    condition     = var.deploy-maas ? var.metallb-ip-pool != "REPLACE ME" && length(var.metallb-ip-pool) != 0 : true
    error_message = "Provide a valid subnet (CIDR Notation) or IP Range (192.168.1.0-192.168.1.255) for MetalLB."
  }
}

############################
# /manifests/vmo-values.yaml
############################

variable "vmo-network-interface" {
  type        = string
  description = "The host network interface VMO will use for VM traffic."
  default     = "br0"

  validation {
    condition     = var.deploy-maas ? var.vmo-network-interface != "REPLACE ME" && length(var.vmo-network-interface) != 0 : true
    error_message = "Provide a valid host network interface for the VMO service to use."
  }
}

variable "vm-vlans" {
  type        = string
  description = "VM allowed VLANs."
  default     = "1"
}

variable "host-vlans" {
  type        = string
  description = "Node Allowed VLANs"
  default     = "1"
}

###############################
# /manifests/ubuntu-values.yaml
###############################

variable "node-network" {
  type        = string
  description = "The subnet the Ubuntu nodes will use."

  validation {
    condition     = var.deploy-maas ? var.node-network != "REPLACE ME" && length(var.node-network) != 0 : true
    error_message = "Provide a valid network (CIDR notation) for the OS to use."
  }
}

#####################
# virtual_machines.tf
#####################

variable "vm-deploy-namespace" {
  type        = string
  description = "The namespace where your VMs will be deployed."
  default     = "virtual-machines"

  validation {
    condition     = var.deploy-maas ? var.vm-deploy-namespace != "REPLACE ME" && length(var.vm-deploy-namespace) != 0 : true
    error_message = "Provide a valid target namespace for your VM deployment."
  }
}

variable "vm-deploy-name" {
  type        = string
  description = "The namespace where your VMs will be deployed."
  default     = "vmo-tutorial-vm"

  validation {
    condition     = var.deploy-maas ? var.vm-deploy-name != "REPLACE ME" && length(var.vm-deploy-name) != 0 : true
    error_message = "Provide a valid name for your VM."
  }
}

variable "vm-labels" {
  type        = set(string)
  description = "The labels that will be applied to your VM."
  default     = ["vmo-tutorial-vm"]

  validation {
    condition     = var.deploy-maas ? var.vm-labels != "REPLACE ME" && length(var.vm-labels) != 0 : true
    error_message = "Provide valid labels for your VM."
  }
}

variable "vm-storage-Gi" {
  type        = string
  description = "The amount of storage to provision for your VM in Gi."

  validation {
    condition     = var.deploy-maas ? var.vm-storage-Gi != "REPLACE ME" && length(var.vm-storage-Gi) != 0 && endswith((var.vm-storage-Gi), "Gi") : true
    error_message = "Provide a valid amount of storage for your VM. You must include 'Gi' at the end of your numerical value. For example, '50Gi'."
  }
}

variable "vm-cpu-cores" {
  type        = number
  description = "Number of CPU cores to allocate to your VM."
  default     = 4

  validation {
    condition     = var.deploy-maas ? var.vm-cpu-cores > 0 : true
    error_message = "Provide a valid number of CPU cores to allocate to your VM."
  }
}

variable "vm-cpu-sockets" {
  type        = number
  description = "Number of CPU sockets the assigned CPU cores should be spread across."
  default     = 1

  validation {
    condition     = var.deploy-maas ? var.vm-cpu-sockets > 0 : true
    error_message = "Provide a valid number of CPU Sockets that your VM must use."
  }
}

variable "vm-cpu-threads" {
  type        = number
  description = "Number of CPU threads your VM can use."
  default     = 1

  validation {
    condition     = var.deploy-maas ? var.vm-cpu-threads > 0 : true
    error_message = "Provide a valid number of CPU threads that your VM should use."
  }
}

variable "vm-memory-Gi" {
  type        = string
  description = "The amount of storage to provision for your VM in Gi."
  default = "8Gi"
  validation {
    condition     = var.deploy-maas ? var.vm-memory-Gi != "REPLACE ME" && length(var.vm-memory-Gi) != 0 && endswith((var.vm-memory-Gi), "Gi") : true
    error_message = "Provide a valid amount of memory to allocate your VM. You must include 'Gi' at the end of your numerical value. For example, '4Gi'."
  }
}