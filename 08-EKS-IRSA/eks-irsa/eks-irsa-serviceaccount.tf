resource "kubernetes_service_account_v1" "irsa_demo_sa" {
  depends_on = [aws_iam_role_policy_attachment.irsa_iam_role_policy_attach]
  metadata {
    name = "irsa-demo-sa"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.eks_irsa_iam_role.arn
    }
  }
}

resource "kubernetes_secret_v1" "irsa_demo_sa" {
  metadata {
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account_v1.irsa_demo_sa.metadata.0.name
    }
  }

  type = "kubernetes.io/service-account-token"
}
