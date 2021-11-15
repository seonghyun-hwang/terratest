resource "aws_route_table_association" "shyun_ngas_a" {
  subnet_id = aws_subnet.shyun_pria.id
  route_table_id = aws_route_table.shyun_ngrt.id
}

resource "aws_route_table_association" "shyun_ngas_c" {
  subnet_id = aws_subnet.shyun_pric.id
  route_table_id = aws_route_table.shyun_ngrt.id
}