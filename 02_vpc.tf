resource "aws_vpc" "shyun_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "name" = "shyun-vpc"
  }
}