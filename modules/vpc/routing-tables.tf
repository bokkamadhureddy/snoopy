# Public routing and associatoin 
resource "aws_route_table" "ec2-public-crt" {
    vpc_id = "${aws_vpc.myvpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.ec2igw.id}"
    }

    tags = {
        Name = "${var.public_routing_table}"
    }
}

//Associate CRT and Subnet
resource "aws_route_table_association" "ass-public-subnet-crt" {
    count = "${length(var.public_subnet_cidr)}"
    subnet_id = "${element(aws_subnet.public-subnets.*.id, count.index)}"
    route_table_id = "${aws_route_table.ec2-public-crt.id}"
}

# Private routing and associatoin 
resource "aws_route_table" "ec2-private-crt" {
    vpc_id = "${aws_vpc.myvpc.id}"
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_nat_gateway.ec2-nat-gw1.id}"
    }

    tags = {
        Name = "${var.private_routing_table}"
    }
}

//Associate CRT and Subnet
resource "aws_route_table_association" "ass-private-subnet-crt" {
    count = length(var.private_subnet_cidr)
    subnet_id  = "${element(aws_subnet.private-subnets.*.id, count.index)}"
    // this is splak systax
    // * --> 0, 1, 2, 3..etc ....
    //once created sudnets we can use like this for adding all subnets
  route_table_id = "${aws_route_table.ec2-private-crt.id}"
}

