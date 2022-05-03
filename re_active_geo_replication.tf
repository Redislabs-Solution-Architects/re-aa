
locals {
  location_1       = var.region_1
  location_2        = var.region_2
  resource_grp_name = azurerm_resource_group.resource-grp-tf.name
  subscription_id   = var.subscription_id

  re_cluster1_name = var.re_cluster1_name
  re_cluster2_name = var.re_cluster2_name
  tags = var.tags
  replication_name = var.replication_name
}

resource "azurerm_resource_group_template_deployment" "re-cluster1" {
  name                = local.re_cluster1_name
  resource_group_name = local.resource_grp_name
  deployment_mode     = "Incremental"
  template_content = templatefile("./template/re_cluster1.json",
    {
      re_name           = local.re_cluster1_name,
      location          = local.location_1,
      subscription_id   = local.subscription_id,
      resource_grp_name = local.resource_grp_name
      tags              = local.tags
      replication_name  = local.replication_name
  })

  depends_on = [azurerm_resource_group.resource-grp-tf]
}

resource "azurerm_resource_group_template_deployment" "re-cluster2" {
  name                = local.re_cluster2_name
  resource_group_name = local.resource_grp_name
  deployment_mode     = "Incremental"
  template_content = templatefile("./template/re_cluster2.json",
    {
      re_name           = local.re_cluster2_name,
      location            = local.location_2,
      re1_deployment_name = local.re_cluster1_name,
      subscription_id     = local.subscription_id,
      resource_grp_name   = local.resource_grp_name
      tags              = local.tags
      replication_name  = local.replication_name
  })

  depends_on = [azurerm_resource_group_template_deployment.re-cluster1]
}