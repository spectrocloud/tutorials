variable "cluster-group-name" {
  type        = string
  default     = "beehive"
  description = "The name of the cluster group to use for the virtual cluster"
}

variable "scenario-one-cluster-name" {
  type        = string
  default     = "cluster-1"
  description = "The name of the cluster to use for the virtual cluster"
}

variable "scenario-two-cluster-name" {
  type        = string
  default     = "cluster-2"
  description = "The name of the cluster to use for the virtual cluster in the second scenario"
}

variable "single-container-image" {
  type        = string
  description = "The name of the container image to use for the virtual cluster in a single scenario"
  default     = "ghcr.io/spectrocloud/hello-universe:1.0.10"
}

variable "multiple_container_images" {
  type        = map(string)
  description = "The name of the container images to use for the virtual cluster in a multiple scenario"
  default = {
    ui  = "ghcr.io/spectrocloud/hello-universe:1.0.12"
    api = "ghcr.io/spectrocloud/hello-universe-api:1.0.8"
  }
}

variable "database-version" {
  type        = string
  description = "The version of Postgres to use"
  default     = "14"
}

variable "database-name" {
  type        = string
  description = "The name of the database"
  default     = "counter"
}

variable "database-user" {
  type        = string
  description = "The name of the database user"
  default     = "pguser"
}

variable "database-ssl-mode" {
  type        = string
  description = "The SSL mode to use for the database"
  default     = "require"
}

variable "token" {
  type        = string
  default     = "931A3B02-8DCC-543F-A1B2-69423D1A0B94"
  description = "The anonymous token to use for the Spectro Cloud API"
}

variable "enable-second-scenario" {
  type        = bool
  description = "Whether to enable the second scenario"
  default     = false
}

variable "tags" {
  type        = list(string)
  description = "The default tags to apply to Palette resources"
  default = [
    "spectro-cloud-education",
    "app:hello-universe",
    "repository:spectrocloud/tutorials/",
    "terraform_managed:true",
    "tutorial:hello-universe-tf"
  ]
}