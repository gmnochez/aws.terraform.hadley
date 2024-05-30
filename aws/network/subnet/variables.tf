
variable "vpc_id" {
  description = "Vpc Id"
}

variable "cidr_block" {
  description = "Cidr Block"
}

variable "tags" {
  description = "Lista de Tags"
  type = list(any)
  default = []
}