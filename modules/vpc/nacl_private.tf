resource "aws_network_acl" "my_vpc_private_cecurity_acl" {
  vpc_id = "${aws_vpc.myvpc.id}"
    # The Subnet ID of the subnet in which to place the gateway.
    count = "${length(var.private_subnet_cidr)}"
    #subnet_id = "${element(aws_subnet.public-subnets.*.id, count.index)}"
  subnet_ids = [ aws_subnet.private-subnets[count.index].id ]
# allow ingress port 22
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${aws_vpc.myvpc.cidr_block}"
    from_port  = 22
    to_port    = 22
  }
  
  # allow ingress port 80 
  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "${aws_vpc.myvpc.cidr_block}"
    from_port  = 8080
    to_port    = 8080
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 250
    action     = "allow"
    cidr_block = "${aws_vpc.myvpc.cidr_block}"
    from_port  = 3608
    to_port    = 3608
  }
  
  # allow ingress ephemeral ports 
  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "${aws_vpc.myvpc.cidr_block}"
    from_port  = 1024
    to_port    = 65535
  }


  
  # allow egress port 22 
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${aws_vpc.myvpc.cidr_block}"
    from_port  = 22 
    to_port    = 22
  }
  
  # allow egress port 80 
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "${aws_vpc.myvpc.cidr_block}"
    from_port  = 80  
    to_port    = 80 
  }
 
   egress {
    protocol   = "tcp"
    rule_no    = 250
    action     = "allow"
    cidr_block = "${aws_vpc.myvpc.cidr_block}"
    from_port  = 3608
    to_port    = 3608
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
    Name = "pri-acl"
}
} # end resource