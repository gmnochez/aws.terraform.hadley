
variable "resource_group_name" {
  description = "Resource group name"
}

variable "description" {
  description = "Description"
}

variable "resourceTypeFilters" {
  description = "Lista de Tipo de Filtros"
  type = list(string)
  default = []
}

variable "tagFilters" {
  description = "Lista de Tags"
  type = list(any)
  default = []
}



variable "tags" {
  description = "Lista de Tags"
  type = list(any)
  default = []
}