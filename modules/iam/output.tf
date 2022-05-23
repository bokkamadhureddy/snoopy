output "role-name" {
  value = "${aws_iam_role.ec2_s3_access_role.name}"
}

output "Instance-role-arn" {
  value = "${aws_iam_role.ec2_s3_access_role.arn}"
}

output "instprofile" {
  value = "${aws_iam_instance_profile.ec2_instance_profile.name}"
}

output "monitoring-role-arn" {
  value = "${aws_iam_role.rds_enhanced_monitoring.arn}"
}
