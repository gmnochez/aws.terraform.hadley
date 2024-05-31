

  resource "aws_security_group_rule" "hadley_resource" {
    for_each = var.security_rule
      type                = each.value.type
      from_port           = each.value.from_port
      to_port             = each.value.to_port
      protocol            = each.value.protocol
      cidr_blocks         = each.value.cidr_blocks
      ipv6_cidr_blocks    = each.value.ipv6_cidr_blocks
      security_group_id   = var.security_group_id
      description         = each.value.description
}
