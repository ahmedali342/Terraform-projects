include {
  path = find_in_parent_folders()
}

terraform {
  source = "file://C:/Ahmed/Devops/Devops/Terraform/Terraform-projects/ec2"
}

inputs = {
  env           = "dev"
  ami           = "ami-062f0cc54dbfd8ef1"
  instance_type = "t2.micro"
}
