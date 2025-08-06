variable "vpcCidr" {
  description = "bloco CIDR da VPC"
  type        = string
  default     = "10.0.0.0/24"
}

variable "enviroment" {
  description = "ambiente escolhido"
  type        = string
}

variable "public_subnet_cidr" {
  description = "valor cidr da subnet publica"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_cidr" {
  description = "valor cidr da subnet privada"
  type        = string
  default     = "10.0.1.0/24"
}

variable "az_zone" {
  description = "zona de disponibilidade para subnets"
  type        = string
  default     = "us-east-1"
}