/*
output "all_users" {
    value = aws_iam_user.user_names
}
*/

output "all-user-arns" {
    value = values(aws_iam_user.user_names)[*].arn
}
