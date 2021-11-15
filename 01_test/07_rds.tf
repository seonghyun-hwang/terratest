resource "aws_db_instance" "shyun_rds" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t2.micro"
  name = "test"
  identifier = "test"
  username = "admin"
  password = "Bespinbespin1!"
  parameter_group_name = "default.mysql8.0"
  availability_zone = "${var.region}${var.ava[0]}"
  db_subnet_group_name = aws_db_subnet_group.shyun-dbsb.id
  vpc_security_group_ids = [aws_security_group.shyun_sg.id]
  skip_final_snapshot = true
  tags = {
    "Name" = "${var.name}-rds"
  }
}

resource "aws_db_subnet_group" "shyun-dbsb" {
  name = "shyun-dbsb-group"
  subnet_ids = [aws_subnet.shyun_pridb[0].id, aws_subnet.shyun_pridb[1].id]
  tags = {
    "Name" = "${var.name}-dbsb-gp"
  }
}