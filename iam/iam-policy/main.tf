resource "aws_iam_policy" "this" {
  name   = var.policy_name
  policy = var.policy_json
}

output "arn" {
  value = aws_iam_policy.this.arn
}
