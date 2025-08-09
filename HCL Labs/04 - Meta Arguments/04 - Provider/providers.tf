terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.7.0"
    }
  }
}

provider "aws" {
  region = "${var.primary_region}"
   alias = "primary"
  default_tags {
    tags = {
      Projeto    = "Ambiente-Desenvolvimento"
      Managed_By = "terraform"
    }
  }
}


provider "aws" {
  region = "${var.secondary_region}"
   alias = "secondary"
  default_tags {
    tags = {
      Projeto    = "Ambiente-Desenvolvimento"
      Managed_By = "terraform"
    }
  }
}