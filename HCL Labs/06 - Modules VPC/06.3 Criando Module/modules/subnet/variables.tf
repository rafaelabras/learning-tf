variable "vpc_id" {
  description = "ID da vpc"
  type        = string
}

variable "az_zone" {
  description = "zona AZ"
  type        = string
  default     = "us-east-1a"
}

variable "subnet_cidr" {
  description = "Bloco CIDR da subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_name" {
  description = "nome da subnet"
  type        = string
  default     = "minha-subnet"
}