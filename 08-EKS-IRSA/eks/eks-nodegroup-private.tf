/*
resource "aws_eks_node_group" "eks_nodegroup_private" {
  cluster_name = aws_eks_cluster.eks_cluster.name

  node_group_name = "${local.name}-eks-ng-private"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = module.vpc.private_subnets

  ami_type       = var.eks_nodegroup_ami_type
  capacity_type  = var.eks_nodegroup_capacity_type
  disk_size      = var.eks_nodegroup_disk_size
  instance_types = var.eks_nodegroup_instance_types

  remote_access {
    ec2_ssh_key = var.eks_nodegroup_ssh_key
  }

  scaling_config {
    desired_size = var.eks_nodegroup_desired_size
    max_size     = var.eks_nodegroup_max_size
    min_size     = var.eks_nodegroup_min_size
  }

  update_config {
    max_unavailable = var.eks_nodegroup_max_unavailable
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = {
    Name = "Private-Node-Group"
  }
}
*/
