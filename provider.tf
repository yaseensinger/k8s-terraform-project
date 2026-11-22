terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    helm = {
        source = "hashicorp/helm"
        version = ">=2.6"
    }
  }
  backend "s3" {
    bucket = "eks-lab-bucket-3424"
    key = "terraform.state"
    region = "eu-west-1"
    encrypt = true
  }
  

}



provider "aws" {
  region = "eu-west-1"

}
 

