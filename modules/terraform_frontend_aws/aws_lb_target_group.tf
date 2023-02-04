resource "aws_lb_target_group" "target_group" {
  name = format("%s-alb-target", local.prefix_lb_name)
  #   target_type = "alb"
  port     = lookup(local.target_info, "port")
  protocol = lookup(local.target_info, "protocol")
  vpc_id   = var.aws_vpc

  tags = merge(
    local.common_tags,
    {
      #key = value
    },
  )
}