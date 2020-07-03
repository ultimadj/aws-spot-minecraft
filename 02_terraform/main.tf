provider "aws" {
  version = "~> 2.69"
  region  = "us-east-1"
}

provider "local" {
  version = "~> 1.4"
}

resource "aws_spot_instance_request" "mc_server" {
  # Amazon Linux
  ami           = "ami-09d95fab7fff3776c"
  spot_price    = "1.00"
  instance_type = "t2.small"
  wait_for_fulfillment = "true"
  key_name  = "aws-spot-minecraft-secrets"
  
  security_groups = ["ssh-only"]

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
      ${aws_spot_instance_request.mc_server.public_dns}
    EOT

    filename = "${path.module}/../03_ansible/inventory.ini"
}
