# Variables with '*' are required

# image_id =              # string, AMI id (recommended to use Golden Image Here)
# vpc_id =                # string, vpc id
# vpc_private_subnets =   # array of string, list of private subnets ids (i.e ["subnet-0bab35c2efbxxxx", "subnet-00bb10f8fa9xxx"])
# vpc_public_subnets =    # array of string, list of public subners ids (i.e ["subnet-0bab35c2efbxxxx", "subnet-00bb10f8fa9xxx"])
# db_instance_type =      # string, instance type (i.e t3.xlarge)
# cidr_db_access =        # array of string, CIDR IP (i.e  ["0.0.0.0/0", "1.1.1.1/32"])
# cidr_rdp_access =       # array of string, CIDR IP (i.e  ["0.0.0.0/0", "1.1.1.1/32"])
# cidr_ssh_access =       # array of string, CIDR IP (i.e  ["0.0.0.0/0", "1.1.1.1/32"])
# db_security_group =     # * array of string, list of security group (i.e ["sg-004d933e7de4xxxx","sg-00ec3aa939dxxxxx"])
# db_private_ip =         # string, private ip
# environment =           # string, application environment
# db_key_pair_name =      # * string, key pair name already exist in AWS
# cidr_on_prem =          # array of string, additional CIDR range from on-prem
# tags =                  # map, preferred tags for DB server (i.e { "Name" : "CEBAMSGAPPDB1" })

db_security_group = ["sg-004d933e7de419f5f","sg-00ec3aa939dac599e"]
db_private_ip = "10.95.165.63"
db_key_pair_name = "operation-bastion"
tags = {
    "Name" = "CEBAMSGORGENDB1"
}