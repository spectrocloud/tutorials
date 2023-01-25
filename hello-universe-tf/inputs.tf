variable "cluster-group-name" {
  type        = string
  default     = "beehive"
  description = "The name of the cluster group to use for the virtual cluster"
}

variable "scenario-one-cluster-name" {
  type        = string
  description = "The name of the cluster to use for the virtual cluster"
}

variable "single-container-image" {
    type        = string
    description = "The name of the container image to use for the virtual cluster in a single scenario"
    default     = "ghcr.io/spectrocloud/hello-universe:1.0.8"
}
