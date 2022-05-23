
# Resource: aws_nat_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

resource "aws_nat_gateway" "ec2-nat-gw1" {
  # The Allocation ID of the Elastic IP address for the gateway.
   allocation_id = aws_eip.ec2-nat1.id
  # The Subnet ID of the subnet in which to place the gateway.
    subnet_id = "${aws_subnet.public-subnets[0].id}"
  # A map of tags to assign to the resource.
  tags = {
    Name = "NATGW-1"
  }
}


