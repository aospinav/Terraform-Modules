output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id

}

output "subnet_a_id" {
  description = "The ID of subnet A"
  value       = aws_subnet.this["public-a"].id

}

output "subnet_b_id" {
  description = "The ID of subnet B"
  value       = aws_subnet.this["public-b"].id

}

output "subnet_c_id" {
  description = "The ID of subnet C"
  value       = aws_subnet.this["public-c"].id

}

