#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
    profile = "${var.profile_type}"
    region = "${var.infra_region}"
}

terraform {
  required_version = "<= 1.1.2" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 3.7.0" #Forcing which version of plugin needs to be used.
      source = "hashicorp/aws"
    }
  }
}