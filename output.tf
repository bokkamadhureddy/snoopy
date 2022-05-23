
output "devvpcid" {
 value = "${module.vpc.vpc-id}"   
}

output "vpc-name" {
    value = "${module.vpc.vpc-name}"
}

output "vpc-region" {
    value = "${module.vpc.env}"
}






