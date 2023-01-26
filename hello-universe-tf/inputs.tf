variable "cluster-group-name" {
  type        = string
  default     = "beehive"
  description = "The name of the cluster group to use for the virtual cluster"
}

variable "scenario-one-cluster-name" {
  type        = string
  default = "cluster-1"
  description = "The name of the cluster to use for the virtual cluster"
}

variable "scenario-two-cluster-name" {
  type        = string
  default = "cluster-2"
  description = "The name of the cluster to use for the virtual cluster in the second scenario"
}

variable "single-container-image" {
  type        = string
  description = "The name of the container image to use for the virtual cluster in a single scenario"
  default     = "ghcr.io/spectrocloud/hello-universe:1.0.8"
}

variable "multiple_container_images" {
  type = map(string)
  description = "The name of the container images to use for the virtual cluster in a multiple scenario"
  default = {
    ui = "ghcr.io/spectrocloud/hello-universe:1.0.8-proxy"
    api = "ghcr.io/spectrocloud/hello-universe-api:1.0.6"
  }
}


variable "tags" {
  type        = list(string)
  description = "The default tags to apply to Palette resources"
  default     = ["scenario-1", "spectro-cloud-education", "app:hello-universe"]
}