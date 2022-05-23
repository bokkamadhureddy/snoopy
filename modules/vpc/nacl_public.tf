resource "aws_network_acl" "my_vpc_public_cecurity_acl" {
  vpc_id = "${aws_vpc.myvpc.id}"
    # The Subnet ID of the subnet in which to place the gateway.
    count = "${length(var.public_subnet_cidr)}"
    #subnet_id = "${element(aws_subnet.public-subnets.*.id, count.index)}"
  subnet_ids = [ aws_subnet.public-subnets[count.index].id ]
# allow ingress port 22

  ingress {
    protocol   = -1
    rule_no    = 1
    action     = "allow"
    cidr_block = "${aws_vpc.myvpc.cidr_block}"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "82.43.52.196/32"
    from_port  = 22
    to_port    = 22
  }

    ingress {
    protocol   = "tcp"
    rule_no    = 150
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }
  
  # allow ingress port 80 
  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

    ingress {
    protocol   = "tcp"
    rule_no    = 250
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
  protocol       = "tcp"
  rule_no        = 300
  action         = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 8080
  to_port        = 8080
}

  ingress {
  protocol       = "tcp"
  rule_no        = 350
  action         = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}

/*
  ingress {
  protocol       = "udp"
  rule_no        = 350
  action         = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}

  ingress {
  protocol       = "icmp"
  rule_no        = 400
  action         = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
  icmp_type      = 0
  icmp_code      = -1
}

*/

  egress {
    protocol   = -1
    rule_no    = 100
#    egress     = true
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

tags = {
    Name = "pub-acl"
}
} # end resource


