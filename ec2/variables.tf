variable "ami" {
  description = "dev AMI (Amazon Linux 2023)"
  default     = "ami-062f0cc54dbfd8ef1"
}

variable "instance_type" {
  description = "dev instance type"
  default     = "t2.micro"
}

variable "env" {
  description = "dev"
  type        = string
}
