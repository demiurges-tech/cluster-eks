resource "aws_lb_target_group" "grp7_target_alb" {
  name     = "grp7targetalb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.grp7_vpc.id
}
