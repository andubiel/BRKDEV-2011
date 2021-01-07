
resource "aws_vpc_peering_connection" "pc" {
  peer_vpc_id = "${module.vpc.vpc_id}"
  vpc_id      = "vpc-eceb118a"
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name = "vpc-default to vpc-clus-eks VPC peering"
  }
}
output "privaterouter_id" {
    value = module.vpc.private_route_table_ids[0]
}

output "vpc-connection" {
  description = "vpc-connection id"
  value     = aws_vpc_peering_connection.pc.id
}

resource "aws_route" "r" {
 route_table_id            = "rtb-473c4d21"
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.pc.id
}

resource "aws_route" "r2" {
  route_table_id            = module.vpc.private_route_table_ids[0]
  destination_cidr_block    = "172.31.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.pc.id
}




