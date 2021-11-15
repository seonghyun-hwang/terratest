resource "aws_route_table" "shyun_ngrt" {
  vpc_id = aws_vpc.shyun_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.shyun_ng.id
  }

  tags = {
    "Name" = "shyun-ngrt"
  }
}