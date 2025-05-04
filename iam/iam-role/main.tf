resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = var.custom_trust_policy
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "attach" {
  for_each = toset(var.policy_arns)

  role       = aws_iam_role.this.name
  policy_arn = each.value
}

output "arn" {
  value = aws_iam_role.this.arn
}
