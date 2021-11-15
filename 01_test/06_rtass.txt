resource "aws_route_table_association" "shyun_rtas_a" {
  subnet_id = aws_subnet.shyun_puba.id
  route_table_id = aws_route_table.shyun_rt.id
}

resource "aws_route_table_association" "shyun_rtas_c" {
  subnet_id = aws_subnet.shyun_pubc.id
  route_table_id = aws_route_table.shyun_rt.id
}