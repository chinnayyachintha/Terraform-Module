variable "cidr_blocks" {
  type        = list(string)
  default     = ""
  description = "List of cidr block ranges"
}

variable "env_prefix" {
  type        = string
  default     = ""
  description = "Environment"
}

variable "region" {
  description = "Region to deploy resources"
  type        = string
  default     = ""
}