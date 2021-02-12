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

The EC2 CLI tool is required for Terrafrom to log into AWS_::

    curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    sudo installer -pkg AWSCLIV2.pkg -target /

Running this command installs also the latest Robot Framework, paramiko_
and scp_ versions. The minimum supported paramiko version is ``1.15.3`` and
minimum supported scp version is ``0.13.0``.
The ``--upgrade`` option can be omitted when installing the library for the
first time.

With recent versions of ``pip`` it is possible to install directly from the
GitHub_ repository. To install latest source from the master branch, use
this command::

    pip install git+https://github.com/robotframework/SSHLibrary.git

Alternatively you can download the source distribution from PyPI_, extract
it, and install it using one of the following depending are you using
Python or Jython::

    python setup.py install
    jython setup.py install
