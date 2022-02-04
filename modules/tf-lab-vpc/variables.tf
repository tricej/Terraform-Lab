variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.120.0.0/16"
}

variable "num_public_subnets" {
  description = "Number of public subnets to create"
  type        = number
  default     = 2
}

variable "num_private_subnets" {
  description = "Number of private subnets to create"
  type        = number
  default     = 2
}

variable "public_cidr_blocks" {
  description = "Available CIDR blocks for public subnets"
  type        = list(string)
  default = [
    "10.120.10.0/24",
    "10.120.11.0/24",
    "10.120.12.0/24",
    "10.120.13.0/24",
    "10.120.14.0/24",
    "10.120.15.0/24",
    "10.120.16.0/24",
    "10.120.17.0/24",
    "10.120.18.0/24",
    "10.120.19.0/24",
  ]
}

variable "private_cidr_blocks" {
  description = "Available CIDR blocks for private subnets"
  type        = list(string)
  default = [
    "10.120.20.0/24",
    "10.120.21.0/24",
    "10.120.22.0/24",
    "10.120.23.0/24",
    "10.120.24.0/24",
    "10.120.25.0/24",
    "10.120.26.0/24",
    "10.120.27.0/24",
    "10.120.28.0/24",
    "10.120.29.0/24",
  ]
}