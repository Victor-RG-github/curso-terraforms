terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.62.0"
    }
  }
  required_version = "~> 1.3.0"
}

provider "aws" {
  region = "eu-north-1"
  alias  = "estocolmo"
}
