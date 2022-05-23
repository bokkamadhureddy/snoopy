# Resource: aws_internet_gateway
resource "aws_internet_gateway" "ec2igw" {
    vpc_id = "${aws_vpc.myvpc.id}"
	tags = {
        Name = "${var.IGW_name}"
    }
}