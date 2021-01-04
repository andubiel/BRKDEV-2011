# # Kubernetes provider
# # https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster#optional-configure-terraform-kubernetes-provider
# # To learn how to schedule deployments and services using the provider, go here: https://learn.hashicorp.com/terraform/kubernetes/deploy-nginx-kubernetes

provider "kubernetes" {
  load_config_file       = "false"
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}


resource "null_resource" "kubectl-create" {  
 provisioner "local-exec" {
   command = "sleep 1120"
}   
provisioner "local-exec" {
  command = "aws eks --region us-west-1 update-kubeconfig --name clus-eks"
}  
provisioner "local-exec" { 
  command = "kubectl create -f nginx-deployment.yaml"
  
  
} 
provisioner "local-exec" {
  command = "kubectl create -f nginx-service.yaml"
  
}
}
resource "null_resource" "kubectl_pods" {  
 provisioner "local-exec" {
   command = "sleep 1155"
 }
provisioner "local-exec" {
   command = "kubectl get pod -o wide"
}
}