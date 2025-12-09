resource "vra_zone" "this" {
  name        = replace(var.name, " ", "-")
  description = var.description
  region_id   = var.region
  folder      = var.folder

  placement_policy = var.placement_policy

  compute_ids = length(var.compute_ids) > 0 ? var.compute_ids : null
  custom_properties = (
    length(var.custom_properties) > 0 ? var.custom_properties : null
  )

  dynamic "tags_to_match" {
    for_each = var.tags_to_match
    content {
      key   = tags_to_match.value["key"]
      value = tags_to_match.value["value"]
    }
  }

  dynamic "tags" {
    for_each = var.capability_tags
    content {
      key   = tags.value["key"]
      value = tags.value["value"]
    }
  }
}
