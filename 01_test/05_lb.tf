#12_alb
resource  "aws_lb"  "shyun_alb" {
  name = "${var.name}-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.shyun_sg.id]
  subnets = [aws_subnet.shyun_pub[0].id,aws_subnet.shyun_pub[1].id] # lb이 사용할 public zone

  tags = {
    "Name" = "${var.name}-alb"
  }
}

#13_albtg
resource "aws_lb_target_group" "shyun_albtg" {
  name = "${var.name}-albtg"
  port = var.port_http
  protocol = var.protocol_http
  target_type = "instance"
  vpc_id = aws_vpc.shyun_vpc.id

  health_check {
    enabled = true
    healthy_threshold = 3
    interval = 5
    matcher = "200"
    path = "/health.html"
    port = "traffic-port"
    protocol = var.protocol_http
    timeout = 2
    unhealthy_threshold = 2
  }
}

#14_albli
resource "aws_lb_listener" "shyun_albli" {
  load_balancer_arn = aws_lb.shyun_alb.arn
  port = "${var.port_http}"
  protocol = var.protocol_http

default_action {
  type = "forward"
  target_group_arn = aws_lb_target_group.shyun_albtg.arn
}
}

#15_albtgatt
resource "aws_lb_target_group_attachment" "shyun_tgatt" {
  target_group_arn = aws_lb_target_group.shyun_albtg.arn
  target_id = aws_instance.shyun_weba.id
  port = var.port_http
}