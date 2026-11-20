locals {
  name   = "eks-lab"
  domain = "lab.yaseensinger.co.uk"
  region = "ue-west-2"

  tags = {
    Enviroment = "sandbox"
    Project    = "eks lab"
    owner      = "yaseen"
  }
}