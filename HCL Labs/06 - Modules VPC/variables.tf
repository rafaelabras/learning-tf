variable "cidr_block" {
    type = string
    description = "Bloco CIDR para vpc"
    default = "10.0.0.0/16"
}

variable "vpc_name" {
    type = string
    description = "Nome da VPC"
    default = "vpc-teste"
}

