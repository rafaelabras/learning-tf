variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "route_table_count" {
  description = "numero de route tables"
  type = number
  default = 2
}

variable "count_resource" {
  description = "Valor para o count em um resource"
  type        = number
  default     = 3
}

variable "count_list" {
  description = "Valor para o count para AZs em um resource"
  type        = list(string)
  default     = ["a", "b", "c"]
}

variable "sg_group" {
  description = "Security group criado por count"
  type = list(object({
    name         = string
    description  = string
    ingress_port = number
  }))
  default = [{
    name         = "web-sg"
    description  = "allow web traffic"
    ingress_port = 80
    }, {
    name         = "app-sg"
    description  = "allow web traffic"
    ingress_port = 8080
    }, {
    name         = "web-db"
    description  = "allow db traffic"
    ingress_port = 3306
    }
  ]
}
