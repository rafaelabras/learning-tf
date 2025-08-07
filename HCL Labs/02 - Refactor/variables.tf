variable "cidr_block" {
  description = "CIDR block para a vpc"
  type        = string
  default     = "192.168.0.0/24"
}

variable "enviroment" {
  description = "ambiente utilizado na cloud"
  type        = string
}

variable "subnet_cidr" {
  description = "bloco CIDR da subnet"
  type        = string
  default     = "192.168.0.1/24"
}

variable "project_name" {
  description = "nome do projeto/infra que esta subindo"
  type        = string
}