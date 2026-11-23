resource "helm_release" "nginx" {
  name = "nginx-ingress"

  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"


  create_namespace = true
  namespace        = "nginx-ingress"

}




resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  take_ownership = true

  set = [
    {
      name  = "crds.enabled"
      value = "true"
    }
  ]

  values = [
    file("helm-values/cert-manager.yaml")
  ]

  depends_on = [
    module.cert_manager_irsa_role
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

resource "helm_release" "argocd-deploy" {
  name       = "argocd-deploy"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.19.15"

  timeout          = 600
  create_namespace = true
  namespace        = "argocd"

  values = [
    file("helm-values/argocd.yaml")
  ]
}