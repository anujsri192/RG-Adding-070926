rgs = {
  rg1 = {
    resource_group_name = "rg-2407"
    location            = "AustraliaEast"
  }
}

vnets = {
  vnet1 = {
    virtual_network_name = "vnet-2407"
    location             = "AustraliaEast"
    resource_group_name  = "rg-2407"
    address_space        = ["10.0.0.0/16"]
  }
}

snets = {
  snet1 = {
    subnet_name          = "snet-2407"
    virtual_network_name = "vnet-2407"
    resource_group_name  = "rg-2407"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snet2 = {
    subnet_name          = "snet-240701"
    virtual_network_name = "vnet-2407"
    resource_group_name  = "rg-2407"
    address_prefixes     = ["10.0.2.0/24"]
  }
  snet3 = {
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "vnet-2407"
    resource_group_name  = "rg-2407"
    address_prefixes     = ["10.0.3.0/26"]
  }
}

pips = {
  bastion_pip = {
    pip_name            = "bastion-pip"
    location            = "AustraliaEast"
    resource_group_name = "rg-2407"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  lb_pip = {
    pip_name            = "lb-pip"
    location            = "AustraliaEast"
    resource_group_name = "rg-2407"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

vms = {
  vm1 = {
    nic_name             = "frontend-nic"
    location             = "AustraliaEast"
    resource_group_name  = "rg-2407"
    virtual_network_name = "vnet-2407"
    subnet_name          = "snet-2407"
    vm_name              = "fontend-vm"
    size                 = "Standard_D2s_v3"
    admin_user           = "anujsri192"
    admin_password       = "Devops@12345"
  }
  vm2 = {
    nic_name             = "backend-nic"
    location             = "AustraliaEast"
    resource_group_name  = "rg-2407"
    virtual_network_name = "vnet-2407"
    subnet_name          = "snet-240701"
    vm_name              = "backend-vm"
    size                 = "Standard_D2s_v3"
    admin_user           = "anujsri192"
    admin_password       = "Devops@12345"
  }
}

bastions = {
  bastion1 = {
    bastion_name         = "bastion-host"
    location             = "AustraliaEast"
    resource_group_name  = "rg-2407"
    virtual_network_name = "vnet-2407"
    subnet_name          = "AzureBastionSubnet"
    public_ip_name       = "bastion-pip"
  }
}

lbs = {
  lb1 = {
    lb_name             = "app-load-balancer"
    location            = "AustraliaEast"
    resource_group_name = "rg-2407"
    frontend_ip_name    = "lb-frontend-ip"
    public_ip_name      = "lb-pip"
    backend_pool_name   = "app-backend-pool"
    probe_name          = "http-probe"
    probe_port          = 80
    rule_name           = "http-rule"
    frontend_port       = 80
    backend_port        = 80
    backend_nics        = ["frontend-nic", "backend-nic"]
  }
}