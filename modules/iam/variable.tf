variable "instanceprofilename" {
  description = "Name of the Instance profile Name"
  type        = string
  default     = null
}
variable "rolename" {
  description = "Name of the IAM role for Instance ."
  type        = string
  default     = null
}
variable "policyname" {
  description = "Name of the Policy Name for Instance "
  type        = string
  default     = null
}

variable "monitoring_role_name" {
  description = "Name of the IAM role which will be created when create_monitoring_role is enabled."
  type        = string
  default     = "rds-monitoring-role"
}

variable "monitoring_role_description" {
  description = "Description of the monitoring IAM role"
  type        = string
  default     = null
}

variable "create_monitoring_role" {
  description = "Create IAM role with a defined name that permits RDS to send enhanced monitoring metrics to CloudWatch Logs."
  type        = bool
  default     = false
}
