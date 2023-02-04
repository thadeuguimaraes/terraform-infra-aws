locals {
  prefix_name    = format("%s_%s", var.environment, var.service)
  prefix_lb_name = format("%s-%s", var.environment, var.service)

  # Regras do security group para o Elastic Load Balancer
  sg_elb_rules_ingress = {
    1 = { description = "Access to HTTP", protocol = "tcp", from_port = "80", to_port = "80", cidr_blocks = ["0.0.0.0/0"] }
  }
  sg_elb_rules_egress = {
    1 = { description = "Acess to out instance", protocol = "tcp", from_port = "0", to_port = "65535", cidr_blocks = ["0.0.0.0/0"] }
  }

  security_elb_rules_ingress = [for rule in local.sg_elb_rules_ingress : {
    from_port       = lookup(rule, "from_port", null)
    description     = lookup(rule, "description", null)
    protocol        = lookup(rule, "protocol", null)
    to_port         = lookup(rule, "to_port", null)
    cidr_blocks     = lookup(rule, "cidr_blocks", null)
    security_groups = lookup(rule, "security_groups", null)
    }
  ]

  security_elb_rules_egress = [for rule in local.sg_elb_rules_egress : {
    from_port       = lookup(rule, "from_port", null)
    description     = lookup(rule, "description", null)
    protocol        = lookup(rule, "protocol", null)
    to_port         = lookup(rule, "to_port", null)
    cidr_blocks     = lookup(rule, "cidr_blocks", null)
    security_groups = lookup(rule, "security_groups", null)
    }
  ]

  # Regras do security group para as instâncias criadas pelo Auto Scaling Group
  sg_asg_rules_ingress = {
    #1 = { description = "Access to HTTP", protocol = "tcp", from_port = "80", to_port = "80", cidr_blocks = ["0.0.0.0/0"] }
  }
  sg_asg_rules_egress = {
    1 = { description = "Acess to out instance", protocol = "tcp", from_port = "0", to_port = "65535", cidr_blocks = ["0.0.0.0/0"] }
  }

  security_asg_rules_ingress = [for rule in local.sg_elb_rules_ingress : {
    from_port       = lookup(rule, "from_port", null)
    description     = lookup(rule, "description", null)
    protocol        = lookup(rule, "protocol", null)
    to_port         = lookup(rule, "to_port", null)
    cidr_blocks     = lookup(rule, "cidr_blocks", null)
    security_groups = lookup(rule, "security_groups", null)
    }
  ]

  security_asg_rules_egress = [for rule in local.sg_elb_rules_egress : {
    from_port       = lookup(rule, "from_port", null)
    description     = lookup(rule, "description", null)
    protocol        = lookup(rule, "protocol", null)
    to_port         = lookup(rule, "to_port", null)
    cidr_blocks     = lookup(rule, "cidr_blocks", null)
    security_groups = lookup(rule, "security_groups", null)
    }
  ]

  target_info = {
    port     = "80"
    protocol = "HTTP"
  }

  scale_number = {
    dev = { min_size = 1, max_size = 3, desired_capacity = 1 }
    prd = { min_size = 1, max_size = 10, desired_capacity = 1 }
  }

  instance_type = {
    dev = "t3.micro"
    prd = "t3.medium"
  }

  common_tags = {
    service     = var.service
    owner       = var.owner
    product     = var.product
    environment = var.environment
  }
}