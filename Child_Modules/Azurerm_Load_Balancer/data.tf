data "azurerm_public_ip" "lb_pip" {
  for_each            = var.lbs
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}

locals {
  nic_associations = flatten([
    for lb_key, lb in var.lbs : [
      for nic in lb.backend_nics : {
        key                 = "${lb_key}-${nic}"
        lb_key              = lb_key
        nic_name            = nic
        resource_group_name = lb.resource_group_name
      }
    ]
  ])
  nic_assoc_map = { for item in local.nic_associations : item.key => item }
}

data "azurerm_network_interface" "backend_nics" {
  for_each            = local.nic_assoc_map
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}
