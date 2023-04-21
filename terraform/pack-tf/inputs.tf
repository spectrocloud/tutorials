variable "cluster_profile_name" {
  type        = string
  description = "Give the cluster-profile a name."
  default     = "pack-tutorial-profile"
}

variable "cluster_profile_description" {
  type        = string
  description = "Provide a description."
  default     = "My cluster profile as part of the packs tutorial."
}

variable "cluster_name" {
  type        = string
  description = "Give the cluster a name."
  default     = "pack-tutorial-cluster"
}

variable "cluster_cloud_account_aws_name" {
  type        = string
  description = "Choose the AWS account integrated with Spektro Palette."
  default     = "spectro-cloud"           # ToDo: Replace this value with the actual  cloud account added to your Palette project settings.
}

variable "aws_region_name" {
  type        = string
  description = "Choose the AWS region."
  default     = "us-east-2"               # ToDo: [Optional] Change the value if you want to deploy to another region.
}

variable "ssh_key_name" {
  type        = string
  description = "Choose the AWS region."
  default     = "aws_key_sk_us_east_2"    # ToDo: Replace this value with the SSH key created in the AWS region where you will deploy the cluster.
}

variable "custom_addon_pack" {
  type        = string
  description = "Custom add-on pack name."
  default     = "hellouniverse"           
}

variable "custom_addon_pack_version" {
  type        = string
  description = "Custom add-on pack version."
  default     = "1.0.0"           
}
variable "private_pack_registry" {
  type        = string
  description = "Private pack registry server name."
  default     = "private-pack-registry"     # ToDo: Provide the name of your private registry server.
}

variable "tags" {
  type        = list(string)
  description = "The default tags to apply to Palette resources"
  # Value and key must be 63 characters or less, must start and end with an alphanumeric character, and can contain only alphanumeric characters, dots, dashes or underscores. 
  # Slashes `\` are not allowed.
  default     = ["spectro-cloud-education", "app:hello-universe", "terraform_managed:true"]
}