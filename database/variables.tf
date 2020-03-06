variable "image_id" {
  type = string
  default = "ami-0a741796a9c548b12"
}

variable "vpc_id" {
    type = string
    default = "vpc-078205fa806d99837" # default ops test vpc id. Change it if based on the LZ usage
}

variable "vpc_private_subnets" {
  type = list(string)
  default = ["subnet-0bab35c2efb7f0e79", "subnet-00bb10f8fa90f8a6b"]
}

variable "vpc_public_subnets" {
    type = list(string)
    default = ["subnet-03fbc8202210bf515", "subnet-00bb10f8fa90f8a6b"]
}

variable "db_instance_type" {
    type = string
    default = "t3.xlarge"
}

variable "cidr_db_access" {
    type = list(string)
    default = [] # IP block range of cebu pacific network
}

variable "cidr_rdp_access" {
   type = list(string)
    default = [] # IP block range of cebu pacific network
}

variable "cidr_ssh_access" {
   type = list(string)
   default = [] # IP block range of cebu pacific network
}

variable "db_security_group" {
    type = list(string)
}

variable "environment" {
    type = string
    default = ""
}

variable "db_private_ip" {
  type = string
  default = ""
}

variable "db_key_pair_name" {
  type = string
}

variable "cidr_on_prem" {
    type = list(string)
    default = []
}

variable "tags" {
    type = map
    default = {}
}

locals {
    db_default_module_tags = {
        "Environment" : var.environment == "" ? "development" : var.environment
        "Description" : "provission one DB instance using terraform"
        "Name" : "CEBAMSGDBMSSQL"
    }
    default_cidr_on_prem = "10.80.0.0/16"
}