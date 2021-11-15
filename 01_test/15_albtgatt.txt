resource "aws_lb_target_group_attachment" "shyun_tgatt" {
  target_group_arn = aws_lb_target_group.shyun_albtg.arn
  target_id = aws_instance.shyun_weba.id
  port = 80  
}