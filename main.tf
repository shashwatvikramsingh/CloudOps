
# 1. Create the main Resource Group for the entire project
module "main_rg" {
  source = "./modules/resource_group" # Calls our RG module

  resource_group_name = var.main_resource_group_name
  location            = var.location
  tags                = var.common_tags
}

# 2. Create MULTIPLE Storage Accounts using for_each
# This loops over the 'storage_accounts_to_create' map from our .tfvars file
module "storage_accounts" {
  source   = "./modules/storage_account"
  for_each = var.storage_accounts_to_create

  # Build the dynamic name here, using the prefix and the random ID
  storage_account_name = "${each.value.name_prefix}${random_id.id.hex}"

  resource_group_name  = module.main_rg.name
  location             = module.main_rg.location
  replication_type     = each.value.replication
  tags                 = merge(var.common_tags, { "Purpose" = each.key })
}

# 3. Create MULTIPLE Virtual Machines using conditional for_each

# We loop over ONE map (var.vms_to_create) and conditionally
# call the correct module based on the 'os_type' property.

module "linux_vms" {
  source   = "./modules/linux_vm"

  for_each = { for vm_key, vm in var.vms_to_create : vm_key => vm if vm.os_type == "linux" }

  vm_name             = each.value.name
  resource_group_name = module.main_rg.name
  location            = module.main_rg.location
  vm_size             = each.value.size
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password
  tags                = merge(var.common_tags, { "Name" = each.value.name })
}

module "windows_vms" {
  source   = "./modules/windows_vm"

  for_each = { for vm_key, vm in var.vms_to_create : vm_key => vm if vm.os_type == "windows" }

  vm_name             = each.value.name
  resource_group_name = module.main_rg.name
  location            = module.main_rg.location
  vm_size             = each.value.size
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password
  tags                = merge(var.common_tags, { "Name" = each.value.name })
}

# 4. Create a single AKS Cluster
# We could also loop this, but we'll create one for this example. Due to lack of quota we not able to provision it for now.


# module "aks_cluster" {
#   source = "./modules/aks_cluster"

#   cluster_name        = var.aks_cluster_name
#   resource_group_name = module.main_rg.name
#   location            = module.main_rg.location
#   dns_prefix          = var.aks_dns_prefix
#   node_count          = 1
#   tags                = var.common_tags
# }


# We need a random ID to make storage names unique
resource "random_id" "id" {
  byte_length = 6
}