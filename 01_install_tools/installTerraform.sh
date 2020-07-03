#!/bin/bash
# Terraform dist page: 
wget https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip -O terraform.zip;
unzip terraform.zip;
sudo mv terraform /usr/local/bin;
rm terraform.zip;