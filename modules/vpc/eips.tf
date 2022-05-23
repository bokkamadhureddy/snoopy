
# Resource: aws_eip
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip


resource "aws_eip" "ec2-nat1" {
  # EIP may require IGW to exist prior to association. 
  # Use depends_on to set an explicit dependency on the IGW.
  depends_on = [aws_internet_gateway.ec2igw]
  
  # A map of tags to assign to the resource.
  tags = {
    Name = "Elastic-1"
  }

}


/*
resource "aws_eip" "ec2-nat2" {
  # EIP may require IGW to exist prior to association. 
  # Use depends_on to set an explicit dependency on the IGW.
  depends_on = [aws_internet_gateway.ec2igw]
}
*/
