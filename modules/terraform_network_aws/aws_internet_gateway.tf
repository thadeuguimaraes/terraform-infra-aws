resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = merge(
    local.common_tags,
    {
      Name = format("%s_igw", var.environment)
    },
  )
}