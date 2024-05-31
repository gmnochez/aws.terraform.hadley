
output "hadley_resource_security_group_rule_id" {
  value = {for k, v in aws_security_group_rule.hadley_resource: k => v.id}
}



