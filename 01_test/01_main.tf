#01_main
provider    "aws" {
    region = var.region
}

#00_ssh
resource "aws_key_pair" "shyun2_key" {
    key_name = var.key
  #  public_key = ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLfTY1GBKqweZivQ4KWxPKDb7vfGrbSOXoFAfV7Hr41yNMtshYRjuDoQ4JqVQNE15z71Djq/foSfs3G818Ui+Lwlo/iYyZeCm89RhimpcZ+5zLCsDYgazNyFDMP1gUqPaU3pXlhfjhoZEaG1G86gCYf2OlLnc1JSxRR3jylmHymlq5XjSeBvCGoeuQiI6Sd0Zluj8Zx7nHo2rlUlb5G0mY5goRhQSFiMfAd69yJi+mNYvEqIL2Zxhudm/VDZ0V/gMeoScqnn4O9skjLnMVN8IZWbUFa0PjQVcOJs7w1xRJaRw6iuP/w36xWDzQ9+zwkcKreafloyTpB19G0Ot95yr9D66uUFpmHfjI9X+lEg8CXOie3iJvhPUnvztO+LpKtMKfrQMasHAhujFxMGulYeImEu6/WoR4Jxa/q9XO7NoWIxlhJrJPqrMjIZ6PA7oWa0LUa+Rus5/8+cf7AOPROu0vmZY+Evb2B51Bg/lo/f0XK+2dIqLcxzKY4XF81Jy9qG0=
    public_key = file("../../../.ssh/shyun-key.pub")
}

#02_vpc
resource "aws_vpc" "shyun_vpc" {
  cidr_block = var.cidr_main
  tags = {
    "Name" = "${var.name}-vpc"
  }
}

#03_subnet
resource "aws_subnet" "shyun_pub" {
    count = length(var.cidr_public) #2
    vpc_id = aws_vpc.shyun_vpc.id
    cidr_block = var.cidr_public[count.index]
    availability_zone = "${var.region}${var.ava[count.index]}"
    tags = {
        "Name" = "${var.name}-pub${var.ava[count.index]}"
    }
}

resource "aws_subnet" "shyun_pri" {
    count = length(var.cidr_private)
    vpc_id = aws_vpc.shyun_vpc.id
    cidr_block = var.cidr_private[count.index]
    availability_zone = "${var.region}${var.ava[count.index]}"
    tags = {
        "Name" = "${var.name}-pri${var.ava[count.index]}"
    }
}

resource "aws_subnet" "shyun_pridb" {
    count = length(var.cidr_privatedb)
    vpc_id = aws_vpc.shyun_vpc.id
    cidr_block = var.cidr_privatedb[count.index]
    availability_zone = "${var.region}${var.ava[count.index]}"
    tags = {
        "Name" = "${var.name}-pridb${var.ava[count.index]}"
    }
}