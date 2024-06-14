# Create a VPC
resource "aws_vpc" "vpc-01" {
  cidr_block = var.cidr_blocks[0].cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

# Module declaration and reference path

module "Myapp_Subnet" {
  source = "./Modules/Subnet"
  cidr_blocks = var.cidr_blocks
  vpc_id = aws_vpc.vpc-01.id
  env_prefix = var.env_prefix
}

# creating security group
resource "aws_security_group" "sg_vpc_01" {
  name = "mySG"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id  = aws_vpc.vpc-01.id

    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
   tags = {
    Name = "${var.env_prefix}-sg-vpc-01"
  }
}

data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = var.values
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "server-key"
  public_key = file(var.public_key_location)  
}

resource "aws_instance" "my-app-server" {
  ami                    = data.aws_ami.latest-amazon-linux-image.id
  instance_type          = var.instance_type
  subnet_id              = module.Myapp_Subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.sg_vpc_01.id]  

  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh-key.key_name 

  tags = {
    Name = "${var.env_prefix}-my-app-server"  
  }
}

