variable "role_name" {}
variable "trust_policy_json" {}
variable "lambda_policy_name" {}
variable "lambda_policy_json" {}
variable "s3_policy_name" {}
variable "s3_policy_json" {}

variable "tags" {
  type = map(string)
}
