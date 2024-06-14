variable "cidr_blocks" {
  type = list(object({
    cidr_block = string
  }))
  description = "List of cidr block ranges"
}

variable "vpc_id" {}

variable "env_prefix" {
  type        = string
  description = "Environment"
}