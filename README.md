# AWS EKS Kubernetes Lab

## Overview

This project is a hands-on lab focused on building and managing a Kubernetes environment on AWS using Terraform.

The goal was to deploy an Amazon EKS cluster and integrate tools for application deployment, ingress traffic management, DNS automation and TLS certificate management.

## Architecture

The project uses the following components:

| Component                | Purpose                                          |
| ------------------------ | ------------------------------------------------ |
| AWS VPC                  | Provides the network infrastructure              |
| Amazon EKS               | Managed Kubernetes cluster                       |
| EC2                      | Worker nodes that run Kubernetes workloads       |
| Terraform                | Infrastructure as Code                           |
| Helm                     | Installs applications into Kubernetes            |
| NGINX Ingress Controller | Manages incoming application traffic             |
| ExternalDNS              | Automatically manages Route 53 DNS records       |
| cert-manager             | Automates TLS certificate issuance and renewal   |
| Let's Encrypt            | Provides TLS certificates                        |
| Argo CD                  | GitOps-based application deployment              |
| IAM / IRSA               | Provides AWS permissions to Kubernetes workloads |

## Architecture Flow

```text
                 Internet
                    |
                Route 53
                    |
             AWS Load Balancer
                    |
             NGINX Ingress
                    |
              Kubernetes
                    |
                 Argo CD

Supporting Components:
- ExternalDNS
- cert-manager
- ClusterIssuer
- Let's Encrypt
```

## Key Features

- Infrastructure provisioned using Terraform.
- Kubernetes cluster deployed using Amazon EKS.
- Worker nodes running on EC2.
- Helm used to deploy Kubernetes applications.
- NGINX used for ingress traffic management.
- ExternalDNS integrated with Route 53.
- cert-manager integrated with Let's Encrypt.
- HTTPS certificates automatically issued and renewed.
- Argo CD deployed for GitOps.

## Challenges & Lessons Learned

During the build, I encountered several issues that helped improve my understanding of Terraform and Kubernetes:

- **Terraform state management:** Investigated the impact of interrupting a Terraform apply operation and handling tainted resources.
- **Helm chart configuration:** Resolved a local directory naming conflict that prevented the cert-manager Helm chart from being located correctly.
- **Kubernetes troubleshooting:** Investigated slow Helm deployments by inspecting Pods, container images and Kubernetes events.

