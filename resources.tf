module "network" {
  source = "./modules/network"

  name_vpc      = var.name_vpc
  vpc_cidr      = var.vpc_cidr
  name_igw      = var.name_igw
  name_rt       = var.name_rt
  setup_subnets = var.setup_subnets

}

module "network_security" {
  source = "./modules/network_security"

  name_sg_http         = var.name_sg_http
  name_sg_ssh          = var.name_sg_ssh
  name_sg_private_http = var.name_sg_private_http
  vpc_id               = module.network.vpc_id
  allowed_ip_range     = var.allowed_ip_range
  custom_ip            = var.custom_ip


}

module "application" {
  source = "./modules/application"

  name_lt       = var.name_lt
  type_instance = var.type_instance
  sg_instance_id = [
    module.network_security.sg_private_http_id,
  module.network_security.sg_ssh_id]
  name_asg           = var.name_asg
  public_subnetA_id  = module.network.subnet_a_id
  public_subnetB_id  = module.network.subnet_b_id
  public_subnetC_id  = module.network.subnet_c_id
  name_load_balancer = var.name_load_balancer
  sg_lb_id           = [module.network_security.sg_http_id]
  vpc_id             = module.network.vpc_id

}

