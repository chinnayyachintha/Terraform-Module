output "vpc_id" {
    value = aws_vpc.vpc-01.id
}

# output values reference form module output reference

output "pub_subnet_id" {
    # value = <module>.<module-name>.<output-name-in-module>.id
    value = module.Myapp_Subnet.pub_subnet.id
}
output "pvt_routable_id"{
    # value = <module>.<module-name>.<output-name-in-module>.id
    value = module.Myapp_Subnet.pvt_routable.id
}
output "IGW_id" {
    # value = <module>.<module-name>.<output-name-in-module>.id    
    value       = module.Myapp_Subnet.IGW.id
}
# output "pvt_subnet_id" {
#     # value = <module>.<module-name>.<output-name-in-module>.id
#     value = module.Myapp_Subnet.pvt_subnet.id
# }

output "pub_route_table_id" {
    # value = <module>.<module-name>.<output-name-in-module>.id
    value = module.Myapp_Subnet.pub_route_table.id
}

output "security_group_id" {
    # value = <module>.<module-name>.<output-name-in-module>.id
    value = module.webserver.security_group.id
}