# BRKDEV-2011
===============

.. contents::

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

.. image:: https://img.shields.io/pypi/l/robotframework-sshlibrary.svg
   :target: http://www.apache.org/licenses/LICENSE-2.0

.. image:: https://api.travis-ci.org/robotframework/SSHLibrary.png
   :target: http://travis-ci.org/robotframework/SSHLibrary


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

   
   
   




Alternatively you can download the source distribution from PyPI_, extract
it, and install it using one of the following depending are you using
Python or Jython::

    python setup.py install
    jython setup.py install
