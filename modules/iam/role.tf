resource "aws_iam_role" "ec2_s3_access_role" {
  name = "${var.rolename}"
  path = "/"
//The path variable in IAM is used for grouping related users and groups in a unique namespace, usually for organizational purposes.
//An IAM role must have a sts:AssumeRole policy and a trust policy attached with the IAM role to allow the IAM user to access the AWS resource using the temporary security credentials. The policy specifies the AWS resource that the IAM user can access and the actions that the IAM user can perform. The trust policy specifies the IAM user from the AWS account that can access the AWS resource.
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF

}



resource "aws_iam_role" "rds_enhanced_monitoring" {
  name               = var.monitoring_role_name
  assume_role_policy = data.aws_iam_policy_document.enhanced_monitoring.json
  description        = var.monitoring_role_description

  tags = merge(
    {
      "Name" = format("%s", var.monitoring_role_name)
    },
    
  )
}

