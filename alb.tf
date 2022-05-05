resource "aws_lb" "demo_alb" {
    name               = "demo-alb"
    internal           = false
    load_balancer_type = "application" 
    security_groups    = [aws_security_group.allow-ssh2.id, aws_security_group.allow-ssh.id]
    subnets            = [aws_subnet.main-public-1.id, aws_subnet.main-private-1.id ]
    enable_cross_zone_load_balancing = "true"
    tags = {
        Name = "demo-alb"
    }
}

resource "aws_lb_listener" "lb_listener_http" {
   load_balancer_arn    = aws_lb.demo_alb.id
   port                 = "80"
   protocol             = "HTTP"
   default_action {
    target_group_arn = aws_lb_target_group.test.id
    type             = "forward"
  }
}

