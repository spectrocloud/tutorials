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

variable "folder" {
  description = "The name of the vSphere folder"
  type        = string
}

variable "host" {
  description = "The name of the vSphere host"
  type        = string
}

variable "ubuntu_ova_url" {
  description = "The URL of the Ubuntu OVA"
  type        = string
  default = "https://cloud-images.ubuntu.com/releases/22.04/release-20230712/ubuntu-22.04-server-cloudimg-amd64.ova"
}