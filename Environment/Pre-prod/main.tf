module "resource_group" {
  source = "../../Child_Modules/Azurerm_Resource_Group"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../Child_Modules/Azurerm_Virtual_Network"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../Child_Modules/Azurerm_Subnet"
  snets      = var.snets
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../Child_Modules/Azurerm_Public_Ip"
  pips       = var.pips
}

module "virtual_machine" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../Child_Modules/Azurerm_Virtual_Machine"
  vms        = var.vms
}

module "bastion" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../Child_Modules/Azurerm_Bastion"
  bastions   = var.bastions
}

module "load_balancer" {
  depends_on    = [module.virtual_machine, module.public_ip]
  source        = "../../Child_Modules/Azurerm_Load_Balancer"
  lbs           = var.lbs
}
