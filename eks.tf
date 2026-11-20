module "eks" {
    source = "terraform-aws-modules/eks/aws"

    cluster = local.name
    cluster_version ="1.23"

}