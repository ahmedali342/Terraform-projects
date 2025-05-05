module "lambda_policy" {
  source      = "./iam-policy"
  policy_name = var.lambda_policy_name
  policy_json = var.lambda_policy_json
}

module "s3_policy" {
  source      = "./iam-policy"
  policy_name = var.s3_policy_name
  policy_json = var.s3_policy_json
}

module "circleci_oidc_role" {
  source              = "./iam-role"
  role_name           = var.role_name
  custom_trust_policy = var.trust_policy_json
  policy_arns         = [module.lambda_policy.arn, module.s3_policy.arn]
  tags                = var.tags
}