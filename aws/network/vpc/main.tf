
  resource "aws_vpc" "hadley_resource" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy


  tags = {
    for tag in var.tags:
    tag.key => tag.value
  }
}
