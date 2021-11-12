resource "aws_autoscaling_attachment" "shyun_asgalbatt" {
  autoscaling_group_name = aws_autoscaling_group.shyun_asg.id
  alb_target_group_arn = aws_lb_target_group.shyun_albtg.arn
}