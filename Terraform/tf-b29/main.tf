module "vpc" {
    source = "./Modules/VPC"
    vpc_cidr_block = var.vpc_cidr_block
    subnet_cidr_block = var.subnet_cidr_block
    az = var.az
    public_ip = var.public_ip


}



module "ec2" {
    source = "./Modules/EC2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    key = var.key
    subnet_id = module.vpc.subnet_id
    security_group_id = module.vpc.sg_id
}
