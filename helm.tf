resource "helm_release" "nginx" {
  name = "nginx-ingress"

  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"


  create_namespace = true
  namespace        = "nginx-ingress"

}




resource "helm_release" "cert-manager" {
  name = "cert-manger"

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"

    set = [
    {
      name  = "crds.enabled"
      value = "true"
    }
  ]
  
  create_namespace = true
  namespace        = "cert-manager"

  values = [
    "${file("helm-values/cert-manager.yaml")}"
  ]

  depends_on = [
  module.cert_manager_irsa_role.iam_role_arn
]
}




resource "helm_release" "external-dns" {
  name = "external-dns"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "external-dns"


  create_namespace = true
  namespace        = "external-dns"

  values = [
    "${file("helm-values/external-dns.yaml")}"
  ]

  depends_on = [
  module.cert_manager_irsa_role.iam_role_arn
]
}
