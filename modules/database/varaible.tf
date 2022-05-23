variable "database_instance_identifier" {
    description = "The name of the RDS instance"
    type        = string
}

variable "storage_type" {
    description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'."
    type        = string
    default     = null
}

variable "storage" {
    description = "The allocated storage in gigabytes"
    type        = string
    default     = null
}

variable "subnet_group_name" {
    description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
    type        = string
    default     = null

}

variable "enable_deletion_protection" {
    description = "Protect deleting the database"
    type        = bool
    default     = null

}

variable "engine" {
    description = "The database engine to use"
    type        = string
    default     = null
}

variable "engine_version" {
    description = "The engine version to use"
    type        = string
    default     = null
}

variable "iam_database_authentication_enabled" {
    description = "Database authentication with IAM"
    type        = bool
    default     = null

}

variable "security_group_rds" {
    description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
    type        = string
    default     = null
}

variable "database_instance_class" {
  description = "The instance class type of the RDS instance"
  type        = string
  default     = null
}

variable "multi_az" {
    description = "Specifies if the RDS instance is multi-AZ"
    type        = bool
    default     = null
}

variable "username" {
    description = "Username for the master DB user"
    type        = string
    default     = null
}

variable "password" {
    description = "Password for the master DB user."
    type        = string
    default     = null
}

variable "port" {
    description = "The port on which the DB accepts connections"
    type        = string
    default     = null
}

variable "skip_final_snapshot" {
    description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted"
    type        = bool
    default     = null
}

variable "name" {
    description = "Name of the database"
    type        = string

}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  type        = number
  default     = 0
}

variable "monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring_interval is non-zero."
  type        = string
  default     = null
}


