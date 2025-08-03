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

provider "random" {}

resource "random_pet" "name" {
  length = 3
}

resource "random_pet" "turtlepet" {
  length = 2
}

output "random_pet_name" {
  value = random_pet.name.id
}