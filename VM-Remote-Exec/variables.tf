variable "name-vmteste" {
  description = "nome vm"
  type        = list(string)
  default     = ["vm01", "vm02", "vm03"]
}

variable "sku-vm" {
  description = "sku vm"
  type        = string
  default     = "Standard_D2s_V3"
}

variable "name-vm" {
  description = "nome vm"
  type        = string
  default     = "LAB-VM"
}

variable "count-add" {
  description = "Quanidade a ser criada"
  type        = number
  default     = 1
}

variable "pass-admin" {
  description = "senha do adm"
  type        = string
  default     = "@#Rafa,321@#"
}

variable "user-admin" {
  description = "user adm"
  type        = string
  default     = "rafael.admin"
}
