resource "aws_iam_user" "org_user" {
  count = 3
  name = var.usernames[count.index]
}