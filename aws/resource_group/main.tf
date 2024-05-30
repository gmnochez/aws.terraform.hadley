resource "aws_resourcegroups_group" "hadley_resource" {
  name     = var.resource_group_name
  description = var.description

  resource_query {
    query = jsonencode({
      ResourceTypeFilters = var.resourceTypeFilters
      TagFilters = var.tagFilters
    })
  }



  tags = {
    for tag in var.tags:
    tag.key => tag.value
  }
}
