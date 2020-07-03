# Infrastructure

### Prep
1. Ensure s3://isajohnson-terraform
1. EC2 -> Network & Security -> Upload public key

### Usage
1. terraform apply
1. terraform state list
1. terraform state show aws_spot_instance_request.mc_server

### Sample State
```
ddjohnson@DESKTOP-QS49IQK:~/z_team/aws-spot-minecraft/terraform$ terraform state show aws_spot_instance_request.mc_server
# aws_spot_instance_request.mc_server:
resource "aws_spot_instance_request" "mc_server" {
    ami                             = "ami-09d95fab7fff3776c"
    associate_public_ip_address     = true
    block_duration_minutes          = 0
    get_password_data               = false
    id                              = "sir-vtxshv9j"
    instance_interruption_behaviour = "terminate"
    instance_type                   = "t2.small"
    ipv6_address_count              = 0
    ipv6_addresses                  = []
    key_name                        = "aws-spot-minecraft-secrets"
    network_interface_id            = "eni-04797ac2d4f7f1052"
    private_dns                     = "ip-172-31-30-243.ec2.internal"
    private_ip                      = "172.31.30.243"
    public_dns                      = "ec2-50-19-158-140.compute-1.amazonaws.com"
    public_ip                       = "50.19.158.140"
    security_groups                 = [
        "ssh-only",
    ]
    source_dest_check               = true
    spot_bid_status                 = "fulfilled"
    spot_instance_id                = "i-0999f7eb72817032e"
    spot_price                      = "1.00"
    spot_request_state              = "active"
    spot_type                       = "persistent"
    subnet_id                       = "subnet-40a7a534"
    tags                            = {
        "Component" = "Minecraft"
        "Name"      = "CheapWorker"
    }
    valid_from                      = "0001-01-01T00:00:00Z"
    valid_until                     = "0001-01-01T00:00:00Z"
    vpc_security_group_ids          = []
    wait_for_fulfillment            = true

    root_block_device {
        delete_on_termination = true
        device_name           = "/dev/xvda"
        encrypted             = false
        iops                  = 100
        volume_id             = "vol-09b33ada48430e5ca"
        volume_size           = 8
        volume_type           = "gp2"
    }
}
```