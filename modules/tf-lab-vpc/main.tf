data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name               = "tf-lab-vpc"
  cidr               = var.vpc_cidr_block
  azs                = data.aws_availability_zones.available.names
  private_subnets    = slice(var.private_cidr_blocks, 0, var.num_private_subnets)
  public_subnets     = slice(var.public_cidr_blocks, 0, var.num_public_subnets)
  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
  }
}

resource "aws_security_group" "allow_ssh_pub" {
  name        = "tf-lab-allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH from the internet"
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

  tags = {
    Name = "tf-lab-allow_ssh_pub"
  }
}

resource "aws_security_group" "allow_ssh_priv" {
  name        = "tf-lab-allow_ssh_priv"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH only from internal VPC clients"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf-lab-allow_ssh_priv"
  }
}