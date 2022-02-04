terraform {
  cloud {
    organization = "trice-lab"
    workspaces {
      name = "tf-lab-vpc"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

