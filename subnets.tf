resource "aws_subnet" "subnet-a" {
    vpc_id = aws_vpc.this.id
    cidr_block =  cidrsubnet(aws_vpc.this.cidr_block, 2, 0)
    ipv6_cidr_block = cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, 0)
    availability_zone = "${var.region}a"
    assign_ipv6_address_on_creation = true


  tags = {
    Name = var.project
  } 
}


resource "aws_subnet" "subnet-b" {
    vpc_id = aws_vpc.this.id
    cidr_block =  cidrsubnet(aws_vpc.this.cidr_block, 2, 1)
    ipv6_cidr_block = cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, 1)
    availability_zone = "${var.region}b"
    assign_ipv6_address_on_creation = true

  tags = {
    Name = var.project
  } 
}

resource "aws_subnet" "subnet-c" {
    vpc_id = aws_vpc.this.id
    cidr_block =  cidrsubnet(aws_vpc.this.cidr_block, 2, 2)
    ipv6_cidr_block = cidrsubnet(aws_vpc.this.ipv6_cidr_block, 8, 2)
    availability_zone = "${var.region}c"
    assign_ipv6_address_on_creation = true

  tags = {
    Name = var.project
  } 
}



