rgs = {
  bholenath = {
    location = "southindia"
  }
}


# stg_details = {
#   stg1 = {
#     name                     = "bholenath"
#     location                 = "southindia"
#     account_tier             = "Standard"
#     account_replication_type = "LRS"
#   }
# }


vnets = {
  vnet_bholenath = {
    resource_group_name = "bholenath"
    location            = "southindia"
    address_space       = ["10.120.0.0/16"]
  }
}


subnets = {
  frontend-subnet = {
    resource_group_name  = "bholenath"
    virtual_network_name = "vnet_bholenath"
    address_prefixes     = ["10.120.10.0/24"]
  }
  backend-subnet = {
    resource_group_name  = "bholenath"
    virtual_network_name = "vnet_bholenath"
    address_prefixes     = ["10.120.20.0/24"]
  }
}


vms = {
  frontendvm = {
    resource_group_name  = "bholenath"
    location             = "southindia"
    virtual_network_name = "vnet_bholenath"
    subnet_name          = "frontend-subnet"
    enable_public_ip     = "Yes" ## Yes or No
    size                 = "Standard_F2"
    admin_username       = "BholeNath"
    admin_password       = "BholeNath@123"
    inbound_open_ports   = ["22", "80", "443"]

    source_image_reference = {
      publisher = "canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }

  }

  backendvm = {
    resource_group_name  = "bholenath"
    location             = "southindia"
    virtual_network_name = "vnet_bholenath"
    subnet_name          = "frontend-subnet"
    enable_public_ip     = "Yes" ## Yes or No
    size                 = "Standard_F2"
    admin_username       = "BholeNath"
    admin_password       = "BholeNath@123"
    inbound_open_ports   = ["22", "80", "443"]

    source_image_reference = {
      publisher = "canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
  }
}


servers_dbs = {
  "devopsinssrv12" = {
    resource_group_name            = "bholenath"
    location                       = "westus"
    version                        = "12.0"
    administrator_login            = "BholeNath"
    administrator_login_password   = "@BholeN@th@123"
    allow_access_to_azure_services = true
    dbs                            = ["todoappdb"]
  }
}