provider "aws" {
  region     = var.region
}

terraform {
  backend "s3" {
    bucket = "tfstate-my-first-iac"
    key = "terraform.tfstate"
    region = "eu-west-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
