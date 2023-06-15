resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.dmzsg.id]
  #subnets            = [data.aws_subnet.dmzsna.id][data.aws_subnet.dmzsnb.id][data.aws_subnet.dmzsnc.id]
  subnets  = var.sndmz

tags = {
    Environment = "production"
  }
}
