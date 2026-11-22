locals {
  name   = "eks-lab"
  domain = "lab.yaseensinger.co.uk"
  region = "eu-west-1"

  tags = {
    Enviroment = "sandbox"
    Project    = "eks-lab"
    owner      = "yaseen"
  }
}