#########
# Palette
#########

variable "palette-project" {
  description = "Palette project name"
  type        = string
}

#####################
# Hello Universe
#####################

variable "app_port" {
  type        = number
  description = "The cluster port number on which the service will listen for incoming traffic."
}

#######
# AWS
#######

variable "deploy-aws" {
  type        = bool
  description = "A flag for enabling a deployment on AWS."
}

#########
# Azure
#########

variable "deploy-azure" {
  type        = bool
  description = "A flag for enabling a deployment on Azure."
}
