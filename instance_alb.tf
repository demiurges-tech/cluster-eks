resource "aws_lb" "alb" {
  name               = "ycochetalb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.security_group_admin.id}"]
  subnets            = [for subnet in aws_subnet.ycochet_pub : subnet.id]

  enable_deletion_protection = false


  tags = {
    Environment = "projet"
  }
}
