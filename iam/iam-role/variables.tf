variable "role_name" {}
variable "custom_trust_policy" {}
variable "policy_arns" {
  type = list(string)
}
variable "tags" {
  type = map(string)
}
