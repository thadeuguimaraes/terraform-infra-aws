resource "aws_lb" "alb" {
  name               = format("%s-alb", local.prefix_lb_name)
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb.id]
  subnets            = var.subnet_ids

  tags = merge(
    local.common_tags,
    {
      #key = value
    },
  )
}