# terraform version
# terraform fmt
# terraform init
# terraform validate
# terraform plan
# terraform plan -out=outputFile
# terraform apply
# terraform apply -auto-approve
# terraform destroy
# terraform destroy -auto-approve
# terraform state list
# terraform --help
# terraform "command" --help

provider "random" {}

provider "aws" {
  region = "us-east-1"
}

# o provider da aws procura automaticamente a AWS_ACCESS_KEY_ID e o AWS_SECRET_ACESS_KEY nas Envs.

variable "num_of_pets" {
  type        = number
  description = "numero de pets que queremos"
}

# Para windows $Env:TF_VAR(nome da variavel)=(valor)
# Para linux export TF_VAR(nome da variavel)=(valor)
resource "random_pet" "name" {
  length = var.num_of_pets
}

resource "random_pet" "turtlepet" {
  length = 2
}

output "random_pet_name" {
  value = random_pet.name.id
}