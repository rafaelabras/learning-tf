variable "vpc_id" {
  description = "id da vpc"
  type        = string
}

variable "subnet_id" {
  description = "id da subnet"
  type        = string
}

variable "ami_id" {
  description = "ID da ami da EC2"
  type        = string
  default     = "ami-0c55b159cbfafc1f0" # amazon linux
}

variable "instance_type" {
  description = "tipo da instancia EC2"
  type        = string
}

variable "instance_name" {
  description = "nome da instancia"
  type        = string
}
