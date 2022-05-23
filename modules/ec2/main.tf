
/*
resource "aws_instance" "ec2_web" {
    count = var.machinecount
     ami = lookup(var.ami,var.region_name)
     #ami = "ami-04505e74c0741db8d"
     instance_type = lookup(var.instance_type,var.environment)
     key_name = var.key_name
     subnet_id = "${var.public_subnets}"
     vpc_security_group_ids = "${var.security_public}"
     associate_public_ip_address = true	
     tags = {
         Name = "${var.vpc-name}-webserver-${count.index+1}"

     }
     user_data = <<-EOF
          #! /bin/bash
          sudo apt-get update
          sudo apt-get install -y nginx
          sudo systemctl start nginx
          sudo systemctl enable nginx
          echo "${var.vpc-name}-webserver-${count.index+1}" | sudo tee /var/www/html/index.nginx-debian.html
        EOF
        
}  */ 

// Creatiing the EC2 instance

resource "aws_instance" "ec2_inst" {
    count = "${var.environment == "prd" ? 2 : 1 }"
     ami = lookup(var.ami,var.region_name)
     #ami = "ami-04505e74c0741db8d"
     instance_type = lookup(var.instance_type,var.environment)
     key_name = var.my_key_name
     subnet_id = "${var.subnets}"
     vpc_security_group_ids = ["${var.security_group}"]
     #iam_instance_profile = var.instance_profile
     associate_public_ip_address = "${var.application_type == "web" ? true : false }"
     tags = {
         Name = "${var.vpc-name}-${var.application_type}-${var.environment}-${count.index+1}"

     }
        
}   