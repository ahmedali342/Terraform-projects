variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "policy_name" {
  type        = string
  description = "The name of the IAM policy to create"
}

variable "policy_description" {
  type        = string
  description = "A description of the IAM policy"
  default     = "Managed by Terraform"
}

variable "policy_json" {
  type        = string
  description = "The full JSON policy document"
}