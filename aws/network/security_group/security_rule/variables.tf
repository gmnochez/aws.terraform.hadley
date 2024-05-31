variable "security_group_id" {
  description = "Security Group Id"
}


variable "security_rule" {
  description = "Network Security Rule Definition"

  type = map(object({
    type                        = string
    from_port                   = number
    to_port                     = number
    protocol                    = string
    cidr_blocks                 = list(string)
    ipv6_cidr_blocks            = list(string)
    description                 = string
    prefix_list_ids             = list(string)  
  }))

  default = {}

}
