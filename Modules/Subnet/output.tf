output "pub_subnet" {
    value = aws_subnet.public_subnet_01
}
output "pvt_routable"{
    value = aws_route_table.pvt-rt
}
output "IGW" {
   value       = aws_internet_gateway.my_igw
}
# output "pvt_subnet" {
#     value = aws_subnet.private_subnet_02
# }

output "pub_route_table" {
    value = aws_route_table.pub-rt
}