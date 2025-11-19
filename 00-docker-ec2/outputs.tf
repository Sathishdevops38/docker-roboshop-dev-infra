# ---------------------------------------------------------
# 4. Outputs (To verify data retrieval)
# ---------------------------------------------------------
output "default_vpc_id" {
  description = "The ID of the default VPC."
  value       = data.aws_vpc.default_vpc.id
}

output "default_subnet_id" {
  description = "The ID of the default Subnet in us-east-1a."
  value       = data.aws_subnet.default_subnet.id
}

output "default_security_group_id" {
  description = "The ID of the default Security Group."
  value       = data.aws_security_group.default_sg.id
}

output "public_ip" {
  value = module.docker.public_ip
}

output "priavte_ip" {
  value = module.docker.private_ip
}

output "public_dns" {
  value = module.docker.public_dns
}