
variable "vpc_id" {
  description = "Vpc Id"
}

variable "name" {
  description = "Name"
}

variable "description" {
  description = "Description"
}


variable "tags" {
  description = "Lista de Tags"
  type = list(any)
  default = []
}