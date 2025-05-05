provider "aws" {
  region = var.aws_region
}

resource "aws_iam_role" "this" {
  name                 = var.role_name
  assume_role_policy   = var.custom_trust_policy
  tags                 = var.tags
}

resource "aws_iam_policy" "lambda" {
  name        = var.lambda_policy_name
  description = "Policy for Lambda functions (CircleCI)"
  policy      = jsonencode(var.lambda_policy_json)
}

resource "aws_iam_policy" "s3" {
  name        = var.s3_policy_name
  description = "Policy for S3 access (CircleCI)"
  policy      = jsonencode(var.s3_policy_json)
}

resource "aws_iam_role_policy_attachment" "lambda_attach" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.lambda.arn
}

resource "aws_iam_role_policy_attachment" "s3_attach" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.s3.arn
}

output "arn" {
  value = aws_iam_role.this.arn
}