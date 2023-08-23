variable "resource_group_location" {
  default     = "uksouth"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID to be unique in the Azure subscription."
}

variable group_name {
    type = string
    description = "kafka_rg"
    default = "kafka_resource_group"
}

