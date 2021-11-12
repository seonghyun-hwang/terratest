resource  "aws_lb"  "shyun_alb" {
  name = "shyun-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.shyun_sg.id]
  subnets = [aws_subnet.shyun_puba.id,aws_subnet.shyun_pubc.id] # lb이 사용할 public zone

  tags = {
    "Name" = "shyun-alb"
  }
}