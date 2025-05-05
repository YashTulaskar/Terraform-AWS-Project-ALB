module "vpc" {
    source = "../modules/vpc"
    cidr_vpc = var.cidr_vpc
    cidr_pubsub1 = var.cidr_pubsub1
    cidr_pubsub2 = var.cidr_pubsub2
}

module "mySG" {
    source = "../modules/SG"
    vpc_id = module.vpc.vpc_id 
}

module "ec2" {S
    source = "../modules/ec2"
    PublicSub1_id = module.vpc.PublicSub1_id
    PublicSub2_id = module.vpc.PublicSub2_id
    SG_ID = module.mySG
}