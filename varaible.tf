variable "infra_type" {
default = "dev"
type = string
description = "name of the environment"
}

variable "infra_region" {
default = "us-east-1"
type = string
description = "name of the region"
}

variable "profile_type" {
default = "default"
type = string
description = "type of the profile to use"
}


variable "aws_profile" {
default = "Madhu"
type = string
description = "name of the aws profile"
}

