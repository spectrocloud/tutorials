variable "palette_project" {
  description = "Palette project name"
  type        = string
}

variable "tags" {
  description = "Tags applied to the cluster profile"
  type        = list(string)
  default     = []
}

variable "app_namespace" {
  type    = string
  default = "hello-universe"
}

variable "app_port" {
  type    = number
  default = 8080
}

variable "replicas_number" {
  type    = number
  default = 1
}

variable "db_password" {
  type = string
}

variable "auth_token" {
  type = string
}
