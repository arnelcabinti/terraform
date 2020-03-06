resource "aws_security_group" "sg_db" {
  name        = "db_instance_access"
  description = "Allow DB inbound traffic"
  vpc_id      =  var.vpc_id

    ingress {
        # MS SQL port access
        from_port   = 1433
        to_port     = 1433
        protocol    = "tcp"
        cidr_blocks = length(var.cidr_db_access) > 0 ? var.cidr_db_access : [local.default_cidr_on_prem]
    }

     ingress {
        # RDP Access
        from_port   = 3389
        to_port     = 3389
        protocol    = "tcp"
        cidr_blocks = length(var.cidr_rdp_access) > 0 ? var.cidr_rdp_access : [local.default_cidr_on_prem]
    }

    ingress {
        # access all port from on-prem IP range
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = length(var.cidr_on_prem) > 0 ? var.cidr_on_prem : [local.default_cidr_on_prem]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}