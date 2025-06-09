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




#####################
# cluster_profiles.tf
#####################

variable "cluster-profile-type" {
  type        = string
  description = "The name of the PCG that will be used to deploy the cluster."

  validation {
    condition     = var.deploy-maas ? var.cluster-profile-type != "REPLACE ME" && lower(var.cluster-profile-type) == "full" || lower(var.cluster-profile-type) == "infrastructure" || lower(var.cluster-profile-type) == "add-on" : true
    error_message = "Cluster profile type must be 'full', 'infrastructure', 'add-on', or 'app'."
  }
}

variable "cluster-profile-version" {
  type        = string
  description = "The name of the PCG that will be used to deploy the cluster."

  validation {
    condition     = var.deploy-maas ? var.cluster-profile-version != "REPLACE ME" && var.cluster-profile-version != "" : true
    error_message = "Cluster profile version must be set."
  }
}

#########################
# clusters.tf
#########################

variable "ctl-node-min-cpu" {
  type        = number
  description = "Minimum number of CPU cores allocated to the Control Plane node."

  validation {
    condition     = var.deploy-maas ? var.ctl-node-min-cpu > 0 : true
    error_message = "Provide a valid number of cores for your Control Plane node."
  }
}

variable "ctl-node-min-memory-mb" {
  type        = number
  description = "Minimum amount of RAM allocated to the Control Plane node."

  validation {
    condition     = var.deploy-maas ? var.ctl-node-min-memory-mb > 0 : true
    error_message = "Provide a valid amount of RAM (MB) for your Control Plane node."
  }
}

variable "wrk-node-min-cpu" {
  type        = number
  description = "Minimum number of CPU cores allocated to the Control Plane node."

  validation {
    condition     = var.deploy-maas ? var.wrk-node-min-cpu > 0 : true
    error_message = "Provide a valid number of cores for your worker node."
  }
}

variable "wrk-node-min-memory-mb" {
  type        = number
  description = "Minimum amount of RAM allocated to the Control Plane node."

  validation {
    condition     = var.deploy-maas ? var.wrk-node-min-memory-mb > 0 : true
    error_message = "Provide a valid amount of RAM (MB) for your worker node."
  }
}

variable "vmo-cluster-name" {
  type        = string
  description = "The name of the cluster."

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

#################
# /manifests/k8s-values.yaml
#################

variable "pod-CIDR" {
  type        = set(string)
  description = "CIDR notation subnets for the pd network ex. 192.168.1.0/24."

  validation {
    condition     = var.deploy-maas ? !contains(var.pod-CIDR, "REPLACE ME") && length(var.pod-CIDR) != 0 : true
    error_message = "Provide a valid Subnet (CIDR Notation) for the pod network."
  }
}

variable "cluster-services-CIDR" {
  type        = set(string)
  description = "CIDR notation subnets for cluster services ex. 192.168.1.0/24."

  validation {
    condition     = var.deploy-maas ? !contains(var.cluster-services-CIDR, "REPLACE ME") && length(var.cluster-services-CIDR) != 0 : true
    error_message = "Provide a valid Subnet (CIDR Notation for cluster services."
  }
}

#####################
# /manifests/metallb-values.yaml
#####################

variable "metallb-ip-pool" {
  type        = set(string)
  description = "CIDR notation subnets or IP range ex. 192.168.1.0/24 or 192.168.1.0-192.168.1.255"

  validation {
    condition     = var.deploy-maas ? !contains(var.metallb-ip-pool, "REPLACE ME") && length(var.metallb-ip-pool) != 0 : true
    error_message = "Provide a valid Subnet (CIDR Notation) or IP Range (192.168.1.0-192.168.1.255) for MetalLB."
  }
}

#################
# /manifests/vmo-values.yaml
#################

variable "vmo-network-interface" {
  type        = set(string)
  description = "The network interface VMO will use for VM traffic."

  validation {
    condition     = var.deploy-maas ? !contains(var.vmo-network-interface, "REPLACE ME") && length(var.vmo-network-interface) != 0 : true
    error_message = "Provide a valid network interface for the VMO service to use."
  }
}

variable "vm-vlans" {
  type        = number
  description = "VM allowed VLANs."
  default     = 1
}

variable "host-vlans" {
  type        = number
  description = "Node Allowed VLANs"
  default     = 1
}

#################
# /manifests/ubuntu-values.yaml
#################

variable "node-network" {
  type        = string
  description = "The subnet the Ubuntu nodes will use."

  validation {
    condition     = var.deploy-maas ? var.node-network != "REPLACE ME" && length(var.node-network) != 0 : true
    error_message = "Provide a valid network interface for the VMO service to use."
  }
}


#####################
# virtual_machines.tf
#####################

variable "vm-deploy-namespace" {
  type        = string
  description = "The namespace where your VMs will be deployed."

  validation {
    condition     = var.deploy-maas ? var.vm-deploy-namespace != "REPLACE ME" && length(var.vm-deploy-namespace) != 0 : true
    error_message = "Provide a valid target namespace for your VM deployment."
  }
}

variable "vm-deploy-name" {
  type        = string
  description = "The namespace where your VMs will be deployed."

  validation {
    condition     = var.deploy-maas ? var.vm-deploy-name != "REPLACE ME" && length(var.vm-deploy-name) != 0 : true
    error_message = "Provide a valid name for your VM."
  }
}

variable "vm-labels" {
  type        = set(string)
  description = "The namespace where your VMs will be deployed."

  validation {
    condition     = var.deploy-maas ? var.vm-labels != "REPLACE ME" && length(var.vm-labels) != 0 : true
    error_message = "Provide valid labels for your VM."
  }
}

variable "vm-storage-Gi" {
  type        = string
  description = "The amount of storage to provision for your VM in Gi."

  validation {
    condition     = var.deploy-maas ? var.vm-storage-Gi != "REPLACE ME" && length(var.vm-storage-Gi) != 0  && endswith((var.vm-storage-Gi), "Gi") : true
    error_message = "Provide a valid amount of storage for your VM. You must include 'Gi' at the end of your numerical value. Example: '50Gi'."
  }
}

variable "vm-cpu-cores" {
  type        = number
  description = "Number of CPU cores to allocate to your VM."
  default     = 1

  validation {
    condition     = var.deploy-maas ? var.vm-cpu-cores > 0 : true
    error_message = "Provide a valid number of CPU cores to allocate to your VM."
  }
}

variable "vm-cpu-sockets" {
  type        = number
  description = "Number of CPU cores to allocate to your VM."
  default     = 1

  validation {
    condition     = var.deploy-maas ? var.vm-cpu-sockets > 0 : true
    error_message = "Provide a valid number of CPU Sockets that your VM must use."
  }
}

variable "vm-cpu-threads" {
  type        = number
  description = "Number of CPU cores to allocate to your VM."
  default     = 1

  validation {
    condition     = var.deploy-maas ? var.vm-cpu-threads > 0 : true
    error_message = "Provide a valid number of CPU threads that your VM should use."
  }
}

variable "vm-memory-Gi" {
  type        = string
  description = "The amount of storage to provision for your VM in Gi."

  validation {
    condition     = var.deploy-maas ? var.vm-memory-Gi != "REPLACE ME" && length(var.vm-memory-Gi) != 0  && endswith((var.vm-memory-Gi), "Gi") : true
    error_message = "Provide a valid amount of memory to allocate your VM. You must include 'Gi' at the end of your numerical value. Example: '4Gi'."
  }
}