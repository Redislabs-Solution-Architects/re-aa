variable "region_1" {
  type        = string
  description = "Primary region 1"
}

variable "region_2" {
  type        = string
  description = "Primary region 2"
}

variable "resource_group_region" {
  type        = string
  description = "Region where resource group is created"
}

variable "resource_group_name" {
  type        = string
  description = "resource group name"
}

variable "re_cluster1_name" {
  type        = string
  description = "Name of the first Redis Enterprise cluster. Something like demo1.test.com"
}

variable "re_cluster2_name" {
  type        = string
  description = "Name of the second Redis Enterprise cluster. Something like demo2.test.com"
}

variable "prefix" {
  type = string
  default = "0"
}

variable "tags" {
  type = map(any)
}

variable "subscription_id" {
  type        = string
  description = "subscription id"
}

variable "replication_name" {
  type        = string
  description = "Replication name shared by the two RE clusters"
}

# region_us     = ["East US", "Central US", "West US", "West US 2", "West US 3", "West Central US", "North Central US", "South Central US"]
# region_apj    = ["East Asia", "Australia East", "Australia Central", "Australia Southeast", "Southeast Asia", "Japan East", "Japan West", "Central India", "South India", "West India"]
# region_ind    = ["Central India", "South India", "West India"]