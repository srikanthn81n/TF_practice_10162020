resource "aws_iam_user" "user_names" {
    for_each = toset(var.names)
    name = each.key
}