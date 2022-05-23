resource "aws_network_acl" "my_vpc_database_cecurity_acl" {
  vpc_id = "${aws_vpc.myvpc.id}"
    # The Subnet ID of the subnet in which to place the gateway.
    count = "${length(var.db_subnet_cidr)}"
   subnet_ids = [ aws_subnet.database-subnets[count.index].id ]
# allow ingress port 3306
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${aws_vpc.myvpc.cidr_block}"
    from_port  = 3306
    to_port    = 3306
  }
  
  
  # allow egress port 3306
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${aws_vpc.myvpc.cidr_block}"
    from_port  = 3306 
    to_port    = 3306
  }
 
  # allow egress ephemeral ports
  egress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "${aws_vpc.myvpc.cidr_block}"
    from_port  = 1024
    to_port    = 65535
  }
tags = {
    Name = "Database-acl"
}
} # end resource