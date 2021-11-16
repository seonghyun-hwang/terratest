variable "name" {
  type = string
  #default = "shyun"
}

variable "region" {
  type = string
  #default = "ap-northeast-2"
}

variable "ava" {
  type = list(string)
  #default = ["a","c"]
}

variable "key" {
  type = string
  #default = "shyun-key"
}

variable "cidr_main" {
  type = string
  #default = "10.0.0.0/16"
}

variable "cidr_public" {
  type = list(string)
  #default = ["10.0.0.0/24","10.0.2.0/24"]
}

variable "cidr_private" {
  type = list(string)
  #default = ["10.0.1.0/24","10.0.3.0/24"]
}

variable "cidr_privatedb" {
  type = list(string)
  #default = ["10.0.4.0/24","10.0.5.0/24"]
}

variable "cidr_route" {
  type = string
  #default = "0.0.0.0/0"
}

variable "ipv6_cidr_blocks" {
  type = string
  #default = "::/0"
}

variable "port_http" {
  type = number
  #default = "80"
}

variable "protocol_tcp" {
  type = string
  #default = "TCP"
}

variable "port_ssh" {
  type = number
  #default = "22"
}

variable "port_sql" {
  type = number
  #default = "3306"
}

variable "protocol_http" {
  type = string
  #default = "HTTP"
}

variable "ins_type" {
  type = string
  #default = "t2.micro"
}

variable "load_type" {
  type = string
  #default = "application"
}

variable "nul" {
  #default = null
}

variable "tg_type" {
  type = string
  #default = "instance"
}

variable "storage_size" {
  type = number
  #default = 20
}

variable "storage_type" {
  type = string
  #default = "gp2"
}

variable "sql_engine" {
  type = string
  #default = "mysql"
}

variable "dbins_type" {
  type = string
  #default = "db.t3.micro"
}

variable "db_name" {
  type = string
  #default = "test"
}

variable "db_username" {
  type = string
  #default = "admin"
}

variable "db_password" {
  type = string
  #default = "Bespinbespin1!"
}