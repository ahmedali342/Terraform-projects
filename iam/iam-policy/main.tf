resource "aws_iam_policy" "default" {
  name        = var.policy_name
  description = var.policy_description
  policy      = var.policy_json
}

output "arn" {
  value       = aws_iam_policy.default.arn
  description = "The ARN of the IAM policy"
}

output "name" {
  value       = aws_iam_policy.default.name
  description = "The name of the IAM policy"
}