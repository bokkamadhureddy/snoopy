resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "${var.instanceprofilename}"
  role = "${aws_iam_role.ec2_s3_access_role.name}"
}