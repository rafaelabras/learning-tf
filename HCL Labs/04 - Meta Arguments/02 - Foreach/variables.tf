variable "route_tables" {
  description = "tabela de rotas"
  type        = map(string)
  default = {
    "public"   = "Public route table"
    "private1" = "Private route table 1"
    "private2" = "Private route table 2"
  }

}

variable "region" {
  description = "regiao aws"
  type        = string
  default     = "us-east-1"
}

variable "subnet_cidr_blocks" {
  description = "bloco CIDR para subnets"
  type        = map(string)
  default = {
    public   = "10.0.1.0/24"
    private1 = "10.0.2.0/24"
    private2 = "10.0.3.0/24"
  }
}

variable "availability_zones" {
  description = "AZs para subnets"
  type        = map(string)
  default = {
    public   = "us-east-1a"
    private1 = "us-east-1b"
    private2 = "us-east-1c"
  }
}

variable "security_groups" {
  description = "nome de security groups"
  type        = map(string)
  default = {
    web = "public"
    app = "private1"
    db  = "private2"
  }
}

variable "sg_ports" {
  description = "Portas para a configuração de cada SG"
  type        = map(number)
  default = {
    web = 80
    app = 8080
    db  = 3306
  }
}

