module "product" {
  source = "../01_test"

  name = "shyun"
  region = "ap-northeast-3"
  ava = ["a","c"]
  key = "shyun-key"
  cidr_main = "192.168.0.0/16"
  cidr_public = ["192.168.0.0/24","192.168.2.0/24"]
  cidr_private = ["192.168.1.0/24","192.168.3.0/24"]
  cidr_privatedb = ["192.168.4.0/24","192.168.5.0/24"]
  cidr_route = "0.0.0.0/0"
  ipv6_cidr_blocks = "::/0"
  port_http = "80"
  protocol_tcp = "tcp"
  port_ssh = "22"
  port_sql = "3306"
  protocol_http = "HTTP"
  load_type = "application"
  tg_type = "instance"
  ins_type = "t3.small"
  storage_size = 20
  storage_type = "gp2"
  sql_engine = "mysql"
  dbins_type = "db.t3.micro"
  db_name = "test"
  db_username = "admin"
  db_password = "Bespinbespin1!"
  nul = null

}