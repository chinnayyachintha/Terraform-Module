#create a public Subnet
resource "aws_subnet" "public_subnet_01" {
    vpc_id     = var.vpc_id
    cidr_block = var.cidr_blocks[1].cidr_block
    tags = {
      Name = "${var.env_prefix}-public-subnet"
    }
}

#private subnet
resource "aws_subnet" "private_subnet-02" {
    vpc_id     = var.vpc_id
    cidr_block = var.cidr_blocks[2].cidr_block
    tags = {
      Name = "${var.env_prefix}-private-subnet"
    }
}

# Internet-Gateway
resource "aws_internet_gateway" "my_igw"{
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.env_prefix}-IGW"
  }
}

#public route table
resource "aws_route_table" "pub-rt"{
   vpc_id = var.vpc_id

   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "${var.env_prefix}-pub-rt"
  }
}

#private route table
resource "aws_route_table" "pvt-rt"{
   vpc_id = var.vpc_id
  tags = {
    Name = "${var.env_prefix}-pvt-rt"
  }
}

#pub-subnet association with pub-route table
resource "aws_route_table_association" "pub_ass_rt"{
  subnet_id = aws_subnet.public_subnet_01.id
  route_table_id = aws_route_table.pub-rt.id
}

# #pvt-subnet association with pvt-route table
# resource "aws_route_table_association" "pvt_ass_rt"{
#   subnet_id = aws_subnet.private_subnet_02.id
#   route_table_id = aws_route_table.pvt-rt.id
# }