

  resource "aws_security_group" "hadley_resource" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  tags = {
    for tag in var.tags:
    tag.key => tag.value
  }
}
