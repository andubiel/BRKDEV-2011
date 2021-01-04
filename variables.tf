variable "region" {
  default = "us-west-1"
}
variable "az"{
  default = ["us-west-1b","us-west-1c"]
}
variable "ami" {
  default = "ami-06cd813f8cdb45baf"
}
variable "instance_type" {
  default = "c4.large"
}
variable "key_name" {
  default = "asassl"
}
variable "subnet_id" {
  default = "subnet-0a903e8e9b80478d5"
}
variable "cluster_name" {
  default = "clus-eks"
}
variable "cidr" {
  default = "10.0.0.0/16"
}
variable "private_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "public_subnets" {
  default = ["10.0.4.0/24", "10.0.5.0/24"]
}
variable "vpc_id" {
  default = "vpc-eceb118a"
}
variable "subnet" {
  default = "10.0.7.0/24"
}
variable "private_ip" {
  default = "10.0.7.5"
}
variable "availability_zone"{
  default = "us-west-1b"
}
variable "peer_vpc_id"{
  default = "clus-eks"
}

