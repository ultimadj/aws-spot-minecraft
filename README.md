# aws-spot-minecraft
Tools and overview: https://sites.google.com/site/djdevwiki/minecraft-spot-server-wsl-terraform-ansible

### Prep
1. Ensure s3://isajohnson-terraform
1. EC2 -> Network & Security -> Upload public key

### Usage
1. terraform apply
1. terraform state list
1. terraform state show aws_spot_instance_request.mc_server

### SSH Access
1. ssh -i aws-spot-minecraft-secrets_id_rsa ec2-user@ec2-54-242-163-89.compute-1.amazonaws.com