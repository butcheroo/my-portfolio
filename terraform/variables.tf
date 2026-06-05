# This file defines all the inputs our Terraform code accepts

variable "environment" {
  description = "The environment we are deploying to"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "The Azure region to deploy to"
  type        = string
  default     = "West Europe"
}

variable "your_name" {
  description = "Your name, used to make resource names unique in Azure"
  type        = string
  default     = "tony"
}