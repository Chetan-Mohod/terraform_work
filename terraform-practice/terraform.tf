terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "state-locking"   #bucket name
    key = "terraform.tfstate"  #State file name
    region = "eu-west-1"
    dynamodb_table = "acrobat-state-table"
  }
}

provider "aws" {
  region = var.aws_region
}
