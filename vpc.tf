resource "aws_vpc" "this" {
  cidr_block       = "172.31.252.0/22"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = var.project
  }
}