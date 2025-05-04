include {
  path = find_in_parent_folders()
}

terraform {
  source = "C:\\Ahmed\\Devops\\Devops\\Terraform\\Terraform-projects\\iam"
}

inputs = {
  role_name           = "circleci-lambda-role"
  lambda_policy_name  = "lambda-update"
  s3_policy_name      = "s3-upload"

  lambda_policy_json = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = ["lambda:UpdateFunctionCode"],
      Resource = "*"
    }]
  })

  s3_policy_json = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = ["s3:PutObject"],
      Resource = "arn:aws:s3:::your-artifacts-bucket/*"
    }]
  })

  trust_policy_json = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Federated = "arn:aws:iam::345594600514:oidc-provider/oidc.circleci.com/org/f405ad0b-ae25-45b6-affe-74768a944f98"
      },
      Action = "sts:AssumeRoleWithWebIdentity",
      Condition = {
        StringEquals = {
          "oidc.circleci.com/org/f405ad0b-ae25-45b6-affe-74768a944f98:sub": "repo:ahmedali342/s3-lambda-function:ref:refs/heads/main"
        }
      }
    }]
  })

  tags = {
    Env    = "dev"
    Owner  = "ahmed"
    Source = "terraform"
  }
}
