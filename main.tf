module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.50.0.0/16"
  vpc_name = "ec2-${var.infra_type}"
  IGW_name = "ec2-igw-${var.infra_type}"
  key_name = "${var.aws_profile}"
  public_subnet_cidr = ["10.50.10.0/24","10.50.11.0/24","10.50.12.0/24"]
  private_subnet_cidr = ["10.50.20.0/24","10.50.21.0/24","10.50.22.0/24"]
  db_subnet_cidr = ["10.50.30.0/24","10.50.31.0/24","10.50.32.0/24"]
  availabulity_zone_names = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_routing_table = "public-routing-table-${var.infra_type}"
  private_routing_table = "private-routing-table-${var.infra_type}"
  infra_env = "${var.infra_type}"
  dns_enable =  true
  dns_hostname = true
  clasiclink_enable = false
  clasiclink_dns_enable = false
  ipv6_enable = false
}

#creating the role with name DevopsTestRole
module "ec2-iam" {
  source = "./modules/iam"
  instanceprofilename = "devops-test-instance-profile-1"
  rolename = "DevopsTestRole"
  policyname = "devops-plolicy1"
  monitoring_role_name = "rds-monitoring-role"
  create_monitoring_role = false

}


module "ec2_webserver" {
  source = "./modules/ec2"
  subnets = "${module.vpc.all-public-subnets[0]}"
  security_group = "${module.vpc.security_group_public}"
  environment = "${module.vpc.env}"
  vpc-name = "${module.vpc.vpc-name}"
  region_name = "${var.infra_region}"
  my_key_name = "${var.aws_profile}"
  application_type = "web"


}
  


module "ec2_appserver" {
  source = "./modules/ec2"
  subnets = "${module.vpc.all-private-subnets[0]}"
  security_group = "${module.vpc.security_group_private}"
  environment = "${module.vpc.env}"
  vpc-name = "${module.vpc.vpc-name}"
  region_name = "${var.infra_region}"
  my_key_name = "${var.aws_profile}"
  application_type = "app"

}


module "rds_dbserver" {
source = "./modules/database"
subnet_group_name = "${module.vpc.db-subnet-name}"
database_instance_identifier = "mysqldatabse"
storage_type = "gp2"
storage = 20
engine = "mysql"
engine_version = "8.0"
iam_database_authentication_enabled = "false"
database_instance_class = "db.t3.small"
multi_az = false
username = "mysql_user"
password = "welcome1"
port = "3306"
skip_final_snapshot = true
name = "mydemodb"
security_group_rds = "${module.vpc.security_group_database}"
enable_deletion_protection = false
monitoring_interval = "30"
monitoring_role_arn = "${module.ec2-iam.monitoring-role-arn}"
}

