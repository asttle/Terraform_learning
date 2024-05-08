data "aws_caller_identity" "current_identity" {   
}

data "aws_iam_users" "current_users" {
}

locals {
  account_id = data.aws_caller_identity.current_identity.account_id
}

resource "aws_iam_user" "new_user" {
    name = "admin-user-${local.account_id}"
}

output "iam_user_name" {
  value = data.aws_iam_users.current_users.names
}

output "iam_user_count" {
    value = length(data.aws_iam_users.current_users.names)
}

