# BRKDEV-2011
===============

Introduction
------------

This repo suppliments the BRKDEEV-2011 CLUS session. This immmutable cloud infrastructure demo focuses on remote access tto a dev/test environment with Terraform and Ansible orchestration.

The demo includes the following components:

- AWS tenant
- AWS EKS (kubenetes) cluster
- NGINX web service
- Cisco ASAv web vpn
- Terraform
- Ansible

![Demo](https://github.com/andubiel/BRKDEV-2011/blob/main/images/Screen%20Shot%202021-02-21%20at%2010.11.08%20PM.png)

Installation
------------
This Demo requires a python3 virtual environement to run pythonic tools.

      $ pip install virtualenv
      $ virtualenv venv
      $ source bin/activate
   
   
Install Ansible and AWS CLI from the activated virtual environemnt.

      $ pip install ansible


The EC2 CLI tool is required for Terrafrom to log into AWS_::

      $ curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
      $ sudo installer -pkg AWSCLIV2.pkg -target /

Configure your own AWS credentials:

      $ aws configure
      AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
      AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
      Default region name [None]: us-west-2
      Default output format [None]: json
   
Install Terraform:

      $ git clone https://github.com/hashicorp/terraform.git
      $ cd terraform
      $ go install
      $ echo $PATH
      $ mv ~/Downloads/terraform /usr/local/bin/
      $ terraform --version
      
Clone files from repo
------------

      $ git clone https://github.com/andubiel/BRKDEV-2011.git
      $ cd BRKDEV-2011.git
      

Prepare Immuttable Infrastrucutre Demo
------------

1) If you haven't done so already use AWS portal to create a private key for SSH to AWS VMs and save to your laptop.
 
2) Prepare a new image for ASAv VMs
From the us-west-1 launch an ASAv image from the AWS marketplace. Launch the image and create a password for the admin account. Save this VM as a new image. This step is required to avoid interactive responces during AWSv bootstrapping later.

3) Glean VPC details 
Using AWS EC2 CLI learn the default VPC id and Subnet

    $ aws ec2 describe-subnets


Configure variables for Demo
------------

    $ vi eks/variables.tf
Edit ami, key_name, vpc_id, and subnet_id

     variable "region" {
        default = "us-west-1"
      }
      variable "az"{
        default = ["us-west-1b","us-west-1c"]
      }
      variable "ami" {
        default = "ami-your ami"
      }
      variable "vpc_id" {
        default = "add your default vpc"
      }
      variable "key_name" {
        default = "your-key"
      }
      variable "subnet_id" {
        default = "subnet-your subnet"

Running the Demo
------------

Make sure to activate python virttual environment.

      $ cd eks/
      $ terraform plan
      $ terraform apply -auto-approve
      
      
Review Standard Output for internal IP address of INGNX service. Note, scroll the terminal up. 
      
      null_resource.kubectl_pods (local-exec): NAME                     READY   STATUS    RESTARTS   AGE   IP           NODE                                             NOMINATED NODE   READINESS GATES
      null_resource.kubectl_pods (local-exec): nginx-587b5c4b5c-hswpd   1/1     Running   0          31s   10.0.1.127<----Change this IP

Review output for ASAv Web VPN Ip address

      webvpn_ip = 13.52.54.170<----Change this IP
      
Validate the Demo
------------
Connect to webvpn IP portal to access NGINX.
Ignore certificate warnings
webvpn = admin/C!sc0123

1) Access the WebVPN and login
![Access Webvpn](https://github.com/andubiel/BRKDEV-2011/blob/main/images/Screen%20Shot%202021-02-21%20at%209.55.06%20PM.png)

![Login Webvpn](https://github.com/andubiel/BRKDEV-2011/blob/main/images/Screen%20Shot%202021-02-21%20at%209.53.17%20PM.png)


2) Connect to NGINX internal IP adddress
![Connect](https://github.com/andubiel/BRKDEV-2011/blob/main/images/Screen%20Shot%202021-02-21%20at%209.55.16%20PM.png)

      
      
     
    
