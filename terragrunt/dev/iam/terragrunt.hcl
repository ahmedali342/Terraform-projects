terraform {
  source = "${get_terragrunt_dir()}/../../../iam/iam-role"
}

locals {
  lambda_policy_json = jsondecode(file("${get_terragrunt_dir()}/../../../iam/env-iam/lambda-policy.json"))
  s3_policy_json     = jsondecode(file("${get_terragrunt_dir()}/../../../iam/env-iam/s3-policy.json"))
  trust_policy_json  = jsondecode(file("${get_terragrunt_dir()}/../../../iam/env-iam/trust-policy.json"))
}

inputs = {
  aws_region           = "ap-south-1"  # Replace with your actual region
  role_name            = "circleci-oidc-role"
  lambda_policy_name   = "CircleCI-LambdaPolicy"
  lambda_policy_json   = local.lambda_policy_json
  s3_policy_name       = "CircleCI-S3Policy"
  s3_policy_json       = local.s3_policy_json
  custom_trust_policy    = local.trust_policy_json

  tags = {
    Environment = "dev"
    Owner       = "you"
  }
}
