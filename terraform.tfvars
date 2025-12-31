# This is our "Data" file. This is the only file you need to
# edit to deploy new resources or change existing ones.

main_resource_group_name = "rg-aura-prod-01"
location                 = "eastus"

common_tags = {
  Project     = "Aura-Dissertation"
  Owner       = "Shashwat.Singh"
  Environment = "Production"
}

# Set the VM username and password we are giving securily as per best practices
vm_admin_username = "cloudadmin"


# This data block will create TWO Storage Accounts

storage_accounts_to_create = {
  logs = {
    name_prefix = "auralogs"    # Changed 'name' to 'name_prefix' and removed interpolation
    replication = "LRS"
  },
  backups = {
    name_prefix = "aurabackups" # Changed 'name' to 'name_prefix' and removed interpolation
    replication = "GRS"
  }
}

# This data block will create VMs based on the OS type.

vms_to_create = {
  linux_web_server_1 = {
    name    = "vm-linux-web-01"
    os_type = "linux"
    size    = "Standard_B1s"
  },

  linux_web_server_2 = {
    name    = "vm-linux-web-02"
    os_type = "linux"
    size    = "Standard_B1s"
  },

  windows_app_server = {
    name    = "vm-win-app-01"
    os_type = "windows"
    size    = "Standard_B2s"
  }
}


