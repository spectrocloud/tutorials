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

# ###########################
# # manifests/k8s-values.yaml
# ###########################

# variable "pod_CIDR" {
#   type        = string
#   description = "Subnet range to be used for pods in the cluster."
# }

# variable "serviceClusterIpRange" {
#   type        = string
#   description = "Subnet range to use for Cluster Services."
#}


# ################################
# #  manifests/metallb-values.yaml
# ################################

# variable "metallb_ip_pool" {
#   type        = number
#   description = "IP addresses to be assigned to MetalLB. Format 1.1.1.1, 1.1.1.2 or '1.1.1.1-1.1.1.2"
#}

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

variable "vmo-cluster-name" {
  type        = string
  description = "Set of node tags for the MAAS control plane nodes."

  validation {
    condition     = var.deploy-maas ? var.vmo-cluster-name != "REPLACE ME" && var.vmo-cluster-name != "" : true
    error_message = "Provide a valid set of node tags for control plane nodes."
  }
}

variable "cluster-profile-type" {
  type        = string
  description = "Identifies profile type of Infrastructure, Full, or Add-on."

  validation {
    condition     = var.deploy-maas ? var.cluster-profile-type != "REPLACE ME" && var.cluster-profile-type != "" : true
    error_message = "Provide a valid cluster profile type."
  }
}

variable "cluster-profile-version" {
  type        = string
  description = "Set the version number of the cluster profile to be created"
  
  validation {
    condition     = var.deploy-maas ? var.cluster-profile-version != "REPLACE ME" && var.cluster-profile-version != "" : true
    error_message = "Provide a valid version number."
  }
}

variable "ctl-node-min-cpu" {
  type        = number
  description = "Set the minimum number of CPU cores to be used for the control plane nodes."

  validation {
    condition     = var.deploy-maas ? var.ctl-node-min-cpu > 0 : true
    error_message = "Provide a valid number of CPU cores to be used for control plane nodes."
  }
}

variable "ctl-node-min-memory-mb" {
  type        = number
  description = "Set the minimum amount of Memory to be used for the control plane nodes."

  validation {
    condition     = var.deploy-maas ? var.ctl-node-min-memory-mb > 0 : true
    error_message = "Provide a valid number  amount of Memory to be used control plane nodes."
  }
}

variable "wrk-node-min-cpu" {
  type        = number
  description = "Set the minimum number of CPU cores to be used for the worker nodes."

  validation {
    condition     = var.deploy-maas ? var.wrk-node-min-cpu > 0 : true
    error_message = "Provide a valid number of CPU cores to be used for control plane nodes."
  }
}

variable "wrk-node-min-memory-mb" {
  type        = number
  description = "Set the minimum amount of Memory to be used for the worker nodes."

  validation {
    condition     = var.deploy-maas ? var.wrk-node-min-memory-mb > 0 : true
    error_message = "Provide a valid amount of Memory to be used for the worker nodes."
  }
}

variable "pod_CIDR" {
  type        = string
  description = "Set the subnet your K8s pods will use."

  validation {
    condition     = var.deploy-maas ? var.pod_CIDR != "REPLACE ME" && var.pod_CIDR != "" : true
    error_message = "Provide a valid subnet in CIDR format ex: 1.1.1.1/24."
  }
}

variable "serviceClusterIpRange" {
  type        = string
  description = "Set the subnet your K8s services will use."

  validation {
    condition     = var.deploy-maas ? var.serviceClusterIpRange != "REPLACE ME" && var.serviceClusterIpRange != "" : true
    error_message = "Provide a valid subnet in CIDR format ex: 1.1.1.1/24."
  }
}

variable "metallb-ip-pool" {
  type        = set(string)     
  description = "Set the IP addresses or subnet range for MetalLB to use for ingress."

  validation {
    condition     = var.deploy-maas ? var.metallb-ip-pool != "REPLACE ME" && var.metallb-ip-pool != "" : true
    error_message = "Provide valid IP addresses or subnet range for MetalLB to use for ingress."
  }
}

variable "vm-deploy-namespace" {
  type        = string
  description = "Set the target namespace where your VM will be deployed."

  validation {
    condition     = var.deploy-maas ? var.vm-deploy-namespace != "REPLACE ME" && var.vm-deploy-namespace != "" : true
    error_message = "Provide valid namespace where your VM will be deployed."
  }
}

variable "vm-deploy-name" {
  type        = string
  description = "Provide a valid name for your VM."

  validation {
    condition     = var.deploy-maas ? var.vm-deploy-name != "REPLACE ME" && var.vm-deploy-name != "" : true
    error_message = "Provide a valid name for your VM."
  }
}

variable "vm-storage-Gi" {
  type        = string
  description = "The amount of storage your VM will have."

  validation {
    condition     = var.deploy-maas ? var.vm-storage-Gi != "REPLACE ME" && var.vm-storage-Gi != "" : true
    error_message = "Provide a valid amount of storage for your VM. Include Gi at the end. Example 50Gi."
  }
}

variable "vm-cpu-cores" {
  type        = number
  description = "Set the minimum number of CPU cores to be used for the control plane nodes."

  validation {
    condition     = var.deploy-maas-vm ? var.vm-cpu-cores > 0 : true
    error_message = "Provide a valid number of CPU cores to be used for control plane nodes."
  }
}

variable "vm-cpu-sockets" {
  type        = number
  description = "The number of CPU sockets the VM will use. This can be multiple to allow for hardware failure."

  validation {
    condition     = var.deploy-maas-vm ? var.vm-cpu-sockets > 0 : true
    error_message = "Provide a valid number of CPU sockets to be used by the VM. This can be multiple to allow for hardware failure."
  }
}

variable "vm-cpu-threads" {
  type        = number
  description = "Set the number of CPU threads the VM will use."

  validation {
    condition     = var.deploy-maas-vm ? var.vm-cpu-threads > 0 : true
    error_message = "Provide a valid number of CPU threads the VM will use."
  }
}

variable "vm-memory-Gi" {
  type        = string
  description = "The amount of memory your VM will have."

  validation {
    condition     = var.deploy-maas ? var.vm-memory-Gi != "REPLACE ME" && var.vm-memory-Gi != "" : true
    error_message = "Provide a valid amount of memory for your VM. Include Gi at the end. Example 4Gi."
  }
}