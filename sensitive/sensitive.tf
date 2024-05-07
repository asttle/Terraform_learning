locals {
  db_password = "sensitive_password"
}

output "db_password" {
  value = local.db_password
  sensitive = true
}