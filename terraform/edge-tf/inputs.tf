variable "cluster_profile_name" {
  type        = string
  description = "Give the cluster-profile a name."
  default     = "edge-tutorial-profile"
}

variable "cluster_profile_description" {
  type        = string
  description = "Provide a description."
  default     = "Cluster profile as part of the edge tutorial."
}

variable "cluster_name" {
  type        = string
  description = "Give the cluster a name."
  default     = "edge-tutorial-cluster"
}

variable "tags" {
  type        = list(string)
  description = "The default tags to apply to Palette resources"
  # Value and key must be 63 characters or less, must start and end with an alphanumeric character, and can contain only alphanumeric characters, dots, dashes or underscores. 
  # Slashes `\` are not allowed.
  default     = ["spectro-cloud-education", "app:hello-universe", "terraform_managed:true"]
}

# ToDo: Provide a value for Palette API key, in the terraform.tfvars. 
variable "sc_api_key" {
  type        = string
  description = "Provide the Palette API key."
}

# ToDo: Provide a value for the Palette project name, in the terraform.tfvars.
variable "sc_project_name" {
  type        = string
  description = "Provide the Palette project name."
}

# ToDo: Provide a value for Virtual IP (VIP) address, in the terraform.tfvars. 
variable "sc_vip" {
  type        = string
  description = "Provide the Virtual IP (VIP) address ."
}

# ToDo: Provide a value for Edge host ID, in the terraform.tfvars. 
variable "sc_host_one" {
  type        = string
  description = "Provide the Edge host ID to add to the master pool."
}

# ToDo: Provide a value for Edge host ID, in the terraform.tfvars. 
variable "sc_host_two" {
  type        = string
  description = "Provide the Edge host ID to add to the worker pool."
}

# ToDo: Provide a value for Edge host ID, in the terraform.tfvars. 
variable "sc_host_three" {
  type        = string
  description = "Provide the Edge host ID to add to the worker pool."
}
