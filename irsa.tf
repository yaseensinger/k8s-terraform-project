module "cert_manager_irsa_role" {
    source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts"


    role_name = "cert-manager"
    attach_cert_manager_policy = true
    cert_manager_hosted_zone_arns = []

    oidc_providers = {
        eks = {
            provider_arn = 
            namespace_service_accounts = ["cert-manager:cert-manager"]

        }
    }
    tags = local.tags

}

module "external_dns_irsa_role" {
    source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts"

    role_name = "external_dns"
    attach_cert_manager_policy = true
    cert_manager_hosted_zone_arns = []

    oidc_providers = {
        eks = {
            provider_arn = 
            namespace_service_accounts = ["external-dns:external-dns"]

        }
    }
    tags = local.tags
