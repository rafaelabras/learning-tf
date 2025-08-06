variable "vpc_cidr" {
  description = "cidr da vpc de desenvolvimento"
  type        = string
  default     = "10.0.0.0/24"
}

variable "subnet_cidr" {
  description = "cidr da subnet"
  type        = string
  default     = "10.0.1.0/24"
}