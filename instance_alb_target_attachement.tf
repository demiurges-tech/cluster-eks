resource "aws_lb_target_group_attachment" "alb_bind" {
  target_group_arn = aws_lb_target_group.grp7_target_alb.arn
  target_id        = aws_instance.grp7_ec2.id
}

