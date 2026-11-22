terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    helm = {
        source = "hashicorp/helm"
        version = ">=2.6"
    }
  }
  backend "s3" {
    bucket = " "
    key = "terraform.state"
    region = "eu-west-1"
    encrypt = true

  }
  required_version = ">=4.0"
  

}



provider "aws" {
  region = "eu-west-1"

}
 

