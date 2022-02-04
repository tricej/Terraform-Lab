module "tf-lab-vpc" {
  source    = "./modules/tf-lab-vpc"
}

module "ec2" {
  source     = "./modules/ec2"
  vpc        = module.tf-lab-vpc.vpc
  sg_pub_id  = module.tf-lab-vpc.sg_pub_id
  sg_priv_id = module.tf-lab-vpc.sg_priv_id
}