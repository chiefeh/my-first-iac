resource "aws_default_route_table" "template" {
  default_route_table_id = aws_vpc.this.main_route_table_id

  tags = {
    Name = var.project
  }
}