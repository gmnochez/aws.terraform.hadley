
  resource "aws_subnet" "hadley_resource" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block

  tags = {
    for tag in var.tags:
    tag.key => tag.value
  }
}
