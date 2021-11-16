#16_ami
resource "aws_ami_from_instance" "shyun_ami" {
  name = "${var.name}_aws_ami"
  source_instance_id = aws_instance.shyun_weba.id

  depends_on = [
    aws_instance.shyun_weba
  ]

  tags = {
    "Name" = "${var.name}-ami"
  }
}

#17_aslc
resource "aws_launch_configuration" "shyun_aslc" {
  name_prefix = "${var.name}-web-"
  image_id = aws_ami_from_instance.shyun_ami.id
  instance_type = var.ins_type
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.shyun_sg.id]
  key_name = var.key
  # user_data = file("./install.sh")

  lifecycle {
    create_before_destroy = true
  }
}

#18_regroup
resource "aws_placement_group" "shyun_place" {
  name = "${var.name}-place"
  strategy = "cluster"
}

#19_asg
resource "aws_autoscaling_group" "shyun_asg" {
  name = "${var.name}_asg"
  min_size = 2
  max_size = 10
  health_check_grace_period = 10
  health_check_type = "EC2"
  desired_capacity = 2
  force_delete = true
  launch_configuration = aws_launch_configuration.shyun_aslc.name
  vpc_zone_identifier = [aws_subnet.shyun_pub[0].id,aws_subnet.shyun_pub[1].id]
}

#20_asgalbatt
resource "aws_autoscaling_attachment" "shyun_asgalbatt" {
  autoscaling_group_name = aws_autoscaling_group.shyun_asg.id
  alb_target_group_arn = aws_lb_target_group.shyun_albtg.arn
}