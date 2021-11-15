resource "aws_ami_from_instance" "shyun_ami" {
  name = "shyun_aws_ami"
  source_instance_id = aws_instance.shyun_weba.id

  depends_on = [
    aws_instance.shyun_weba
  ]

  tags = {
    "Name" = "shyun-ami"
  }
}