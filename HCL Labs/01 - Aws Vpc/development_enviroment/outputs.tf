output "account_id" {
  description = "Id da conta atual"
  value       = data.aws_caller_identity.current.account_id
  sensitive   = true
}

output "region_name" {
  description = "Nome da regiao"
  value       = data.aws_region.current.region
}

output "azS" {
  description = "zonas de disponibilidade"
  value       = data.aws_availability_zone.avaliable.all_availability_zones
}

output "cobminando_info" {
  description = "combinando o id da conta com a região"
  value       = "${data.aws_caller_identity.current.account_id}-${data.aws_region.current.region}"
}

output "vpc_id" {
  description = "id da vpc"
  value       = aws_vpc.development_vpc.id
}