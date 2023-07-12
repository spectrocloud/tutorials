variable "datacenter" {
  description = "The name of the vSphere datacenter"
  type        = string
}

variable "cluster" {
  description = "The name of the vSphere cluster"
  type        = string
}

variable "datastore" {
  description = "The name of the vSphere datastore"
  type        = string
}

variable "network" {
  description = "The name of the vSphere network"
  type        = string
}

variable "resource_pool" {
  description = "The name of the vSphere resource pool"
  type        = string
}

variable "host" {
  description = "The name of the vSphere host"
  type        = string
}