terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.7.0"
    }
  }
}

# $Env:AWS_ACCESS_KEY_ID="chave"
# $Env:AWS_SECRET_ACCESS_KEY="chave" 
# export AWS_ACCESS_KEY_ID="chave"
# export AWS_SECRET_ACCESS_KEY="chave"

provider "aws" {
  region = "us-east-1"
}