output "hadley_resource_resource_group_name" {
  value = aws_resourcegroups_group.hadley_resource.name
}

output "hadley_resource_resource_group_id" {
  value = azurerm_resource_group.hadley_resource.id
}
