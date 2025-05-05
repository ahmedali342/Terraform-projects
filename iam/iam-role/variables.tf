variable "role_name" {
  type        = string
  description = "The name of the IAM role to create"
}

variable "custom_trust_policy" {
  type        = string
  description = "The trust policy JSON for the IAM role"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to the IAM role"
  default     = {}
}

variable "lambda_policy_name" {
  type        = string
  description = "The name of the Lambda IAM policy"
}

variable "lambda_policy_json" {
  type        = any
  description = "The JSON content of the Lambda IAM policy"
}

variable "s3_policy_name" {
  type        = string
  description = "The name of the S3 IAM policy"
}

variable "s3_policy_json" {
  type        = any
  description = "The JSON content of the S3 IAM policy"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}