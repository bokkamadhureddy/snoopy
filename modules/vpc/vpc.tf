resource "aws_vpc" "myvpc" {
    cidr_block = "${var.vpc_cidr}"
    # Required for EKS. Enable/disable DNS support in the VPC.
    enable_dns_support = var.dns_enable
     # Required for EKS. Enable/disable DNS hostnames in the VPC.
    enable_dns_hostnames = var.dns_hostname
    # Enable/disable ClassicLink for the VPC.
    enable_classiclink = var.clasiclink_enable
    # Enable/disable ClassicLink DNS Support for the VPC.
    enable_classiclink_dns_support = var.clasiclink_dns_enable
    # Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC.
    assign_generated_ipv6_cidr_block = var.ipv6_enable

    tags = {
        Name = "${var.vpc_name}"
	Owner = "Madhu Bokka"
    Name = "Demo"
	environment = "${var.infra_env}"
    }
}




