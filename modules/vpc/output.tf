output "vpc-id" {
  value = "${aws_vpc.myvpc.id}"
}
output "vpc-name" {
  value = "${aws_vpc.myvpc.tags.Name}"
}

output "all-public-subnets" {
 
  value = "${aws_subnet.public-subnets.*.id}"
}
output "all-private-subnets" {
 
  value = "${aws_subnet.private-subnets.*.id}"
}


output "db-subnet-name" {
  value = "${aws_db_subnet_group.db-sub-group.name}"
}

output "all-databse-subnets" {
 
  value = "${aws_subnet.database-subnets.*.id}"
}

output "public-routing-id" {
  value = "${aws_route_table.ec2-public-crt.id}"
}
output "private-routing-id" {
  value = "${aws_route_table.ec2-private-crt.id}"
}


output "security_group_public" {
  value = aws_security_group.public.id
}
 
output "security_group_private" {
  value = aws_security_group.private.id
}

output "security_group_database" {
  value = aws_security_group.database_sql.id
}



output "env" {
  value = "${var.infra_env}"
}