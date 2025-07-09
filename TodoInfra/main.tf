
module "rg" {
  source = "../Modules/ResourceGroup"
  rgs    = var.rgs
}


module "vnet" {
  depends_on = [module.rg]
  source     = "../Modules/Networking"
  vnets      = var.vnets
  subnets    = var.subnets
}



module "vm" {
  depends_on = [module.vnet]
  source     = "../Modules/VirtualMachine"
  vms        = var.vms
}


module "servers_dbs" {
  depends_on  = [module.vm]
  source      = "../Modules/Database"
  servers_dbs = var.servers_dbs
}
