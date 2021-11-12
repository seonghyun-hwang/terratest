resource "aws_placement_group" "shyun_place" {
  name = "shyun-place"
  strategy = "cluster"
}