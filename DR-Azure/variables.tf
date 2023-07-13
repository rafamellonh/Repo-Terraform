variable "rg-name" {
  description = "Nome do RG"
  type        = string
}

variable "location-prd" {
  description = "Localização PRD"
  type        = string
}

variable "location-dr" {
  description = "Localização DR"
  type        = string
}

variable "vm-front" {
  description = "VM do FrontEnd"
  type        = string
}

variable "vm-sql" {
  description = "VM do Banco MS SQL"
  type        = string
}

variable "vm-dc01" {
  description = "VM do Domain Control"
  type        = string
}

variable "vnet-front" {
  description = "VNET do Front"
  type        = string
}

variable "sub-front" {
  description = "Subnet do front"
}

variable "vnet-sql" {
  description = "VNET do sql"
  type        = string
}

variable "sub-sql" {
  description = "Subnet do sql"
  type        = string
}

variable "vnet-dc" {
  description = "VNET do DC"
  type        = string
}

variable "sub-DC" {
  description = "Subnet do DC"
  type        = string
}

variable "nsg-front" {
  description = "NSG do Front"
  type        = string
}
