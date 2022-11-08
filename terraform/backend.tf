terraform {
  backend "s3" {
    bucket = "rhill-terraform"
    key    = "infrastructure/terraform.tfstate"
    region = "us-west-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = "1.3.4"
}

provider "aws" {
  region = "us-west-2"
}
