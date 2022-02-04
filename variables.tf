variable "aws_region" {
  description = "Default AWS Region"
  default     = "us-west-2"
}

variable "AWS_SECRET_ACCESS_KEY" {
}

variable "AWS_ACCESS_KEY_ID" {
}

variable "ec2_instance_type" {
  description = "Type of EC2 instance to launch"
  default     = "t2.micro"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}