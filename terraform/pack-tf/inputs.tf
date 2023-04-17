variable "cluster_profile_name" {
  type        = string
  description = "Give the cluster-profile a name."
  default     = "pack-tutorial-profile"
}

variable "cluster_profile_description" {
  type        = string
  description = "Provide a description."
  default     = "My cluster profile as part of the packs tutorial"
}

variable "cluster_name" {
  type        = string
  description = "Give the cluster a name."
  default     = "pack-tutorial-cluster"
}

variable "cluster_cloud_account_aws_name" {
  type        = string
  description = "Choose the AWS account integrated with Spektro Palette."
  default     = "spectro-cloud"           # ToDo: Change the value here.
}

variable "aws_region_name" {
  type        = string
  description = "Choose the AWS region."
  default     = "us-east-2"               # ToDo: Change the value here.
}

variable "ssh_key_name" {
  type        = string
  description = "Choose the AWS region."
  default     = "aws_key_sk_us_east_2"    # ToDo: Change the value here.
}

variable "custom_addon_pack" {
  type        = string
  description = "Custom add-on pack name."
  default     = "hellouniverse"             # ToDo: Change the value here.
}

variable "private_pack_registry" {
  type        = string
  description = "Private pack registry server name."
  default     = "private-pack-registry"     # ToDo: Change the value here.
}

variable "tags" {
  type        = list(string)
  description = "The default tags to apply to Palette resources"
  default     = ["spectro-cloud-education", "app:hello-universe", "repository:spectrocloud/tutorials/", "terraform_managed:true"]
}