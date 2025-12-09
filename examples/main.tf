data "vra_region" "all" {}

module "cloud_zones" {
  source  = "sentania-labs/vmapps-cloudzone/vra"
  version = "0.2.0"

  for_each = data.vra_region.all

  name        = "${each.value.name}-cz"
  description = "Cloud zone for ${each.value.name}"
  region      = each.value.id

  placement_policy = var.placement_policy
  folder           = var.folder

  tags_to_match     = var.tags_to_match
  capability_tags   = var.capability_tags
  compute_ids       = var.compute_ids
  custom_properties = var.custom_properties
}
