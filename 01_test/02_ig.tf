#04_ig
resource "aws_internet_gateway" "shyun_ig" {
    vpc_id = aws_vpc.shyun_vpc.id
    tags = {
        "Name" = "${var.name}-ig"
    }
}

#05_rt
resource "aws_route_table" "shyun_rt" {
    vpc_id = aws_vpc.shyun_vpc.id
    route {
        cidr_block = var.cidr_route
        gateway_id = aws_internet_gateway.shyun_ig.id
    }
    tags = {
        "Name" = "${var.name}-rt"
    }
}
#06_rtass
resource "aws_route_table_association" "shyun_rtas_pub" {
  count = length(var.cidr_public)
  subnet_id = aws_subnet.shyun_pub[count.index].id
  route_table_id = aws_route_table.shyun_rt.id
}