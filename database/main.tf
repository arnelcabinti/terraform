provider "aws" {
  region  = "ap-southeast-1"
  version = "2.7"
}

resource "aws_instance" "dbInstance" {
    ami = var.image_id
    instance_type = var.db_instance_type
    subnet_id = element(var.vpc_private_subnets, 0) # get specific subnet in index 0 of vpc_private_subnets array
    vpc_security_group_ids  = concat(var.db_security_group, [aws_security_group.sg_db.id])
    private_ip = var.db_private_ip != "" ? var.db_private_ip : ""
    tags = merge(local.db_default_module_tags, var.tags)
    key_name = var.db_key_pair_name
    root_block_device {
        volume_size           = 50
        volume_type           = "gp2"
    }
    ebs_block_device {
        device_name = "xvdf"
        volume_size = 100
        volume_type = "gp2"
        delete_on_termination = false
    }
}