output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "PublicSub1_id" {
  value = aws_subnet.PublicSub1.id
}

output "PublicSub2_id" {
  value = aws_subnet.PublicSub2.id
}
