# Create a VPC
resource "aws_vpc" "vpc-01" {
  cidr_block = var.cidr_blocks[0].cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

# Subnet  Module declaration and reference path 

module "Myapp_Subnet" {
  source = "./Modules/Subnet"
  cidr_blocks = var.cidr_blocks
  vpc_id = aws_vpc.vpc-01.id
  env_prefix = var.env_prefix
}

# Instance(Webserver)  Module declaration and reference path 

module "webserver" {
  source ="./Modules/web-server"
  vpc_id = aws_vpc.vpc-01.id
  env_prefix = var.env_prefix
  values = var.values
  public_key_location  = var.public_key_location
  instance_type = var.instance_type
  subnet_id = module.Myapp_Subnet.pub_subnet.id

}