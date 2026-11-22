
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.34.0"

  cluster_name    = local.name
  cluster_version = "1.34"

  cluster_endpoint_public_access = true

  enable_irsa = true

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.public_subnets

  eks_managed_node_group_defaults = {
    disk_size      = 50
    instance_types = ["t3.small"]
  }

  eks_managed_node_groups = {
    default = {
      min_size     = 1
      max_size     = 3
      desired_size = 2
    }
  }
}
