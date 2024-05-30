
variable "cidr_block" {
  description = "Cidr Block"
}

variable "instance_tenancy" {
  description = "Instance Tenancy"
}


variable "tags" {
  description = "Lista de Tags"
  type = list(any)
  default = []
}