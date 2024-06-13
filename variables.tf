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

variable "region" {
  description = "Region to deploy resources"
  type        = string
}

variable "values" {
  description = "Name filter values for the AMI"
  type        = list(string)
}

variable "public_key_location" {
  description = "Path to the public key file"
  type        = string
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}
