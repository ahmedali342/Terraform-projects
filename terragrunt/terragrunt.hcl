terraform {
  source = "${get_repo_root()}/iam/env-iam"
}

inputs = {
  role_name           = "circleci-oidc-role"
  lambda_policy_name  = "CircleCI-LambdaPolicy"
  lambda_policy_json  = file("${get_repo_root()}/iam/env-iam/lambda-policy.json")
  s3_policy_name      = "CircleCI-S3Policy"
  s3_policy_json      = file("${get_repo_root()}/iam/env-iam/s3-policy.json")
  trust_policy_json   = file("${get_repo_root()}/iam/env-iam/trust-policy.json")

  tags = {
    Environment = "dev"
    Owner       = "you"
  }
}
