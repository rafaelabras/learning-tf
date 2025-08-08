terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.70"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Projeto    = "Ambiente-Desenvolvimento"
      Managed_By = "terraform"
    }
  }
}