resource "aws_lb_target_group" "alb-example" {
  name        = "tf-example-lb-alb-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.TestVPC.id
 

 health_check {
    path = "/sap/wdisp/admin/publicicp/show_init_statepub.icp"
    port = 8443
    healthy_threshold = 4
    unhealthy_threshold = 2
    interval = 30
    timeout = 5
    matcher = "200,301,404"
 }
  
  stickiness {
    cookie_duration = "3600"
    type = "lb_cookie"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-TLS13-1-0-2021-06"
  #certificate_arn   = "arn:aws:iam::123455678:server-certificate/test_cert_sdgkjsgdjj45659027"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-example.arn
  }
}
