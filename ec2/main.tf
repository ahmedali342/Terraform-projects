terraform {
  backend "s3" {}
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "keypair-${var.env}"
  public_key = file("${path.root}/ssh-key/key.pub")  # Correct path for Terragrunt directory structure
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow-ssh-${var.env}"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "dev_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true

  tags = {
    Name      = "dev-ec2-${var.env}"
    ManagedBy = "Terragrunt"
    FreeTier  = "true"
  }
}
