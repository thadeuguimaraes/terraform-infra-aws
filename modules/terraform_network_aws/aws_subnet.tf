resource "aws_subnet" "private" {
  for_each          = local.subnet_private
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = merge(
    local.common_tags,
    {
      Name = format("%s_private_%s", var.environment, each.key)
    },
  )
}

resource "aws_subnet" "public" {
  for_each          = local.subnet_public
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = merge(
    local.common_tags,
    {
      Name = format("%s_public_%s", var.environment, each.key)
    },
  )
}