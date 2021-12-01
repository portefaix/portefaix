# Copyright (C) 2021 Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

resource "azurerm_subnet" "this" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = module.vnet.vnet_name
  address_prefixes     = [var.subnet_prefix]
}

resource "azurerm_public_ip" "this" {
  name                = var.service_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_bastion_host" "this" {
  name                = var.service_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  ip_configuration {
    name                 = var.service_name
    subnet_id            = azurerm_subnet.this.id
    public_ip_address_id = azurerm_public_ip.this.id
  }
}

# module "bastion" {
#   source  = "kumarvna/azure-bastion/azurerm"
#   version = "1.1.0"

#   resource_group_name  = azurerm_resource_group.bastion.name
#   virtual_network_name = module.vnet.vnet_name

#   azure_bastion_service_name          = var.service_name
#   azure_bastion_subnet_address_prefix = var.subnet_prefix

#   tags = var.tags

#   depends_on = [azurerm_resource_group.bastion]
# }
