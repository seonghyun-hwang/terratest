resource "aws_db_instance" "shyun_rds" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t2.micro"
  name = "mydb"
  identifier = "test"
  username = "admin"
  password = "Bespinbespin1!"
  parameter_group_name = "default.mysql8.0"
  availability_zone = "ap-northeast-2a"
  db_subnet_group_name = aws_db_subnet_group.shyun-dbsb.id
  vpc_security_group_ids = [aws_security_group.shyun_sg.id]
  skip_final_snapshot = true
  tags = {
    "Name" = "shyun-rds"
  }
}

resource "aws_db_subnet_group" "shyun-dbsb" {
  name = "shyun-dbsb-group"
  subnet_ids = [aws_subnet.shyun_pridba.id, aws_subnet.shyun_pridbc.id]
  tags = {
    "Name" = "shyun-dbsb-gp"
  }
}