//
resource "aws_iam_policy_attachment" "policy-attachment-role" {
  name       = "policy-attachment"
  #users      = [aws_iam_user.user.name]
  #groups     = [aws_iam_group.group.name]
  roles      = ["${aws_iam_role.ec2_s3_access_role.name}"]
  policy_arn = "${aws_iam_policy.s3-policy.arn}"
}

resource "aws_iam_role_policy_attachment" "enhanced_monitoring" {
  role       = "${aws_iam_role.rds_enhanced_monitoring.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}