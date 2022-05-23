resource "aws_subnet" "public-subnets" {
    count = "${length(var.public_subnet_cidr)}"
    vpc_id = "${aws_vpc.myvpc.id}"
    cidr_block = "${element(var.public_subnet_cidr, count.index)}"
    availability_zone = "${element(var.availabulity_zone_names, count.index)}"
    map_public_ip_on_launch = true //it makes this a public subnet
    //map_public_ip_on_launch: This is so important. 
    //The only difference between private and public subnet is this line. 
    //If it is true, it will be a public subnet, otherwise private.
    tags = {
        Name = "${var.vpc_name}_Public_Subnet_${count.index+1}"
    }
}

resource "aws_subnet" "private-subnets" {
    count = "${length(var.private_subnet_cidr)}"
    vpc_id = "${aws_vpc.myvpc.id}"
    cidr_block = "${element(var.private_subnet_cidr, count.index)}"
    availability_zone = "${element(var.availabulity_zone_names, count.index)}"

    tags = {
        Name = "${var.vpc_name}_Private_Subnet_${count.index+1}"
    }
}


resource "aws_subnet" "database-subnets" {
    count = "${length(var.db_subnet_cidr)}"
    vpc_id = "${aws_vpc.myvpc.id}"
    cidr_block = "${element(var.db_subnet_cidr, count.index)}"
    availability_zone = "${element(var.availabulity_zone_names, count.index)}"

    tags = {
        Name = "${var.vpc_name}_Database_Subnet_${count.index+1}"
    }
}


resource "aws_db_subnet_group" "db-sub-group" {
  name       = "mysqlgroup"
  subnet_ids = flatten([aws_subnet.database-subnets.*.id])
  tags = {
    Name = "mysql"
  }
}


