#07_ng
resource "aws_eip" "shyun_eip_ng" {
  vpc = true
}

resource "aws_nat_gateway" "shyun_ng" {
  allocation_id = aws_eip.shyun_eip_ng.id
  subnet_id = aws_subnet.shyun_pub[0].id
  tags = {
    "Name" = "${var.name}-ng"
  }
  depends_on = [
   aws_internet_gateway.shyun_ig 
  ]
}

#08_ngrt
resource "aws_route_table" "shyun_ngrt" {
  vpc_id = aws_vpc.shyun_vpc.id
  
  route {
    cidr_block = var.cidr_route
    gateway_id = aws_nat_gateway.shyun_ng.id
  }

  tags = {
    "Name" = "${var.name}-ngrt"
  }
}

#09_ngass
resource "aws_route_table_association" "shyun_ngas" {
  count = length(var.cidr_public)
  subnet_id = aws_subnet.shyun_pri[count.index].id
  route_table_id = aws_route_table.shyun_ngrt.id
}