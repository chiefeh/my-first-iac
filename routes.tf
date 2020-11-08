resource "aws_route" "template-v4" {
  route_table_id = aws_vpc.this.default_route_table_id

  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.this.id

}

resource "aws_route" "template-v6" {
  route_table_id = aws_vpc.this.default_route_table_id

  destination_ipv6_cidr_block = "::/0"
  gateway_id = aws_internet_gateway.this.id

}