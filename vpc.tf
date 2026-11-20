module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.9.0"

  name = loclas.name

  cidr = "10.0.0.0/16"

  azs = ["{$locals.region}a", "{$locals.region}b", "{$locals.region}c"]

  private_subnets = ["10.0.1.0/24, 10.0.3.0/24, 10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24, 10.0.5.0/24, 10.0.6.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.to/cluster/${local.name}" = "shared"
    "kubernetes.io/role/elb"              = 1
  }

  private_subnet_tags = {
    "kubernetes.to/cluster/${local.name}" = "shared"
    "kubernetes.io/role/internal-elb"     = 1
  }
  tags = local.tags
}
