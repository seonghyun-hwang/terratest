resource "aws_eip" "shyun_eip_ng" {
  vpc = true
}

resource "aws_nat_gateway" "shyun_ng" {
  allocation_id = aws_eip.shyun_eip_ng.id
  subnet_id = aws_subnet.shyun_puba.id
  tags = {
    "Name" = "shyun-ng"
  }
  depends_on = [
   aws_internet_gateway.shyun_ig 
  ]
}