output "vpc" {
  value = aws_vpc.my_vpc
}

output "subnet_private" {
  value = aws_subnet.private
}

output "subnet_public_id" {
  value = values(aws_subnet.public).*.id
}