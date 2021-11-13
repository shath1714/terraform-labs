#create VPC
resource "aws_vpc" "ffhs-vpc" {
  cidr_block           = var.cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  enable_classiclink   = var.enable_classiclink

  tags = {
    Name = var.tags
  }

}

#create IG and attache it to VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ffhs-vpc.id

  tags = {
    Name = "internet-gateway"
  }
}

#assign eip
resource "aws_eip" "ffhsiptestlab" {
  vpc = true
}
