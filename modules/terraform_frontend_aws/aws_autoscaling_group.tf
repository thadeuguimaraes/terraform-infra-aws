resource "aws_autoscaling_group" "asg" {
  name_prefix               = format("%s_asg_", local.prefix_name)
  max_size                  = lookup(local.scale_number, var.environment)["max_size"]
  min_size                  = lookup(local.scale_number, var.environment)["min_size"]
  desired_capacity          = lookup(local.scale_number, var.environment)["desired_capacity"]
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  launch_configuration      = aws_launch_configuration.foobar.name
  vpc_zone_identifier       = var.subnet_ids

  dynamic "tag" {
    for_each = local.common_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  tag {
    key                 = "Name"
    value               = local.prefix_name
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }
}