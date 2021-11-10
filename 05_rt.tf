resource "aws_route_table" "shyun_rt" {
    vpc_id = aws_vpc.shyun_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.shyun_ig.id
    }
    tags = {
        "name" = "shyun-rt"
    }
}