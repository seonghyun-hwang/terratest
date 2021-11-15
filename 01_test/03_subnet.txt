resource "aws_subnet" "shyun_puba" {
    vpc_id = aws_vpc.shyun_vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-northeast-2a"
    tags = {
        "Name" = "shyun-puba"
    }
}

resource "aws_subnet" "shyun_pria" {
    vpc_id = aws_vpc.shyun_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-2a"
    tags = {
        "Name" = "shyun-pria"
    }
}

resource "aws_subnet" "shyun_pubc" {
    vpc_id = aws_vpc.shyun_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-northeast-2c"
    tags = {
        "Name" = "shyun-pubc"
    }
}

resource "aws_subnet" "shyun_pric" {
    vpc_id = aws_vpc.shyun_vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-northeast-2c"
    tags = {
        "Name" = "shyun-pric"
    }
}

resource "aws_subnet" "shyun_pridba" {
    vpc_id = aws_vpc.shyun_vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "ap-northeast-2a"
    tags = {
        "Name" = "shyun-pridba"
    }
}

resource "aws_subnet" "shyun_pridbc" {
    vpc_id = aws_vpc.shyun_vpc.id
    cidr_block = "10.0.5.0/24"
    availability_zone = "ap-northeast-2c"
    tags = {
        "Name" = "shyun-pridbc"
    }
}