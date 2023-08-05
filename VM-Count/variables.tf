variable "name-vmteste" {
  description = "nome vm"
  type        = list(string)
  default     = ["vm01", "vm02", "vm03"]
}

variable "sku-vm" {
  description = "sku vm"
  type        = string
  default     = "Standard_B1s"
}

variable "name-vm" {
  description = "nome vm"
  type        = string
  default     = "LAB-VM"
}

variable "count-add" {
    description = "Quanidade a ser criada"
    type = number
    default = 4
}