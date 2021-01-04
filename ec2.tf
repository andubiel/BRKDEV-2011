


resource "aws_instance" "asav" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name 
  subnet_id     = var.subnet_id
  
  
  tags = {
    Name = "asav"
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.allow_mgmt.id
  network_interface_id = aws_instance.asav.primary_network_interface_id
  
}
# resource block for eip #
resource "aws_eip" "asa_ip" {
  vpc      = true
}

# resource block for ec2 and eip association #
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.asav.id
  allocation_id = aws_eip.asa_ip.id
}
  

resource "aws_security_group" "allow_mgmt" {
  name        = "allow_mgmt"
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_id
  #vpc_id = module.vpc.vpc_id
  
  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow ssl"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_mgmt"
  }
} 

output "webvpn_ip" {
  value = aws_eip.asa_ip.public_ip
}


resource "null_resource" "inventory" {  
    provisioner "local-exec" {
   command = "sleep 190"
} 
provisioner "local-exec" {
  command  = "rm ../ansible/hosts" 
}    
provisioner "local-exec" {
  command  = "touch ../ansible/hosts" 
}  
provisioner "local-exec" {
  command  = "echo  [asa] >> ../ansible/hosts" 
}
provisioner "local-exec" {
  command  = "echo ${aws_eip.asa_ip.public_ip} ansible_user=admin  ansible_ssh_private_key_file=asassl.pem ansible_network_os=asa >> ../ansible/hosts"  
    }
}
resource "null_resource" "ansible" {
  provisioner "local-exec" {
   command = "sleep 630"
  }
  provisioner "local-exec" {
   command = "ansible-playbook -i ../ansible/hosts ../ansible/asa.yml" 
  }
}
