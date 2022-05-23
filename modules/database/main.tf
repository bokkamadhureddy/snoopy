
resource "aws_db_parameter_group" "mysqlpara" {
  name   = "rds-mysql"
  family = "mysql8.0"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}


resource "aws_db_instance" "demo-mysql-db" {
  
  instance_class                      = var.database_instance_class
  identifier                          = var.database_instance_identifier
  storage_type                        = var.storage_type
  allocated_storage                   = var.storage
  db_subnet_group_name                = var.subnet_group_name
  deletion_protection                 = var.enable_deletion_protection
  engine                              = var.engine
  engine_version                      = var.engine_version
  # Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled.
  iam_database_authentication_enabled = var.iam_database_authentication_enabled 
  parameter_group_name = "${aws_db_parameter_group.mysqlpara.id}"
  multi_az                            = var.multi_az
  username                            = var.username
  password                            = var.password
  port                                = var.port
  name                                = var.name
  skip_final_snapshot                 = var.skip_final_snapshot
  vpc_security_group_ids              = [var.security_group_rds]
  monitoring_interval                 = var.monitoring_interval
  monitoring_role_arn                 = var.monitoring_role_arn
  
}