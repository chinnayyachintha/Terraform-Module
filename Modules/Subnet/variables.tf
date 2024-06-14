
variable "vpc_id" {}

variable "cidr_blocks" {
  type = list(object({
    cidr_block = string
  }))
  description = "List of cidr block ranges"
}

variable "env_prefix" {
  type        = string
  description = "Environment"
}