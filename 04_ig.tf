# 10.0.0.0/16 VPC 전용 Internet Gateway
resource "aws_internet_gateway" "shyun_ig" {
    vpc_id = aws_vpc.shyun_vpc.id
    tags = {
        "Name" = "shyun-ig"
    }
}