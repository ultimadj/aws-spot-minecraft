provider "aws" {
  version = "~> 2.69"
  region  = "us-east-1"
}

provider "local" {
  version = "~> 1.4"
}

resource "aws_security_group" "mc_server" {
  name        = "mc_server"
  description = "Allow Minecraft inbound traffic"

  ingress {
    description = "Minecraft from VPC"
    from_port   = 25565
    to_port     = 25565
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
    Name = "mc_server"
  }
}

resource "aws_spot_instance_request" "mc_server" {
  # Amazon Linux
  ami           = "ami-09d95fab7fff3776c"
  spot_price    = "1.00"
  instance_type = "t2.small"
  wait_for_fulfillment = "true"
  key_name  = "aws-spot-minecraft-secrets"
  
  security_groups = ["ssh-only", "mc_server"]

  tags = {
    Name      = "CheapWorker"
    Component = "Minecraft"
  }

  root_block_device {
    volume_size = "8"
  }
}

resource "local_file" "ansible_inventory" {
    content     = <<-EOT
      [mc_server]
      ${aws_spot_instance_request.mc_server.public_dns} ansible_user=ec2-user ansible_ssh_private_key_file=../../aws-spot-minecraft-secrets/aws-spot-minecraft-secrets_id_rsa
    EOT

    filename = "${path.module}/../03_ansible/inventory.ini"
}

resource "local_file" "connect_sh" {
    content     = <<-EOT
      #!/bin/bash
      DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
      ssh -i $DIR/../../../aws-spot-minecraft-secrets/aws-spot-minecraft-secrets_id_rsa ec2-user@${aws_spot_instance_request.mc_server.public_dns}
    EOT

    filename = "${path.module}/../04_admin/bin/connect.sh"
}
