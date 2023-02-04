resource "aws_vpc" "my_vpc" {
  cidr_block = "${local.network_prefix}.0.0/16"

  tags = merge(
    local.common_tags,
    {
      Name = format("%s_vpc", var.environment)
    },
  )
}