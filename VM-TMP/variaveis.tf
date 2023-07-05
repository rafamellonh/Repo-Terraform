variable "rg" {
  description = "Name of RG"
  default     = "rg10"
}

variable "location" {
  description = "Region"
  default     = "eastus"
}

variable "vnetName" {
  description = "Name of VNET"
  default     = "vnetTmp"
}

variable "nameSubnet" {
description = "name of subnet"
default = "subTmp"
}