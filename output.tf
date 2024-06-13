output "vpc_id" {
    value = aws_vpc.vpc-01.id
}
output "pvt_routable"{
    value = aws_route_table.pvt-rt.id
}
output "IGW" {
   value       = aws_internet_gateway.my_igw.id
}
output "pvt_subnet" {
    values = aws_subnet.private_subnet-02.id
}
output "pub_subnet" {
    value = aws_subnet.public_subnet-01.id
}
output "pub_route_table" {
    value = aws_route_table.pub-rt.id
}
output "" {
    value = aws_security_group.sg-vpc-01.id
}