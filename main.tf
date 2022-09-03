provider "azurerm" {
features {}
}
resource "azurerm_network_security_group" "example" {
  name                = var.nsg_names[count.index]
  location            = "eastus"
  resource_group_name = "rg"
  count = 2

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
  
  variable "nsg_names" {
    default=["nsg1","nsg2","nsg3"]
  }
    

