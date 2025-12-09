variable "name" {
  type        = string
  description = "Name of the Cloud Zone"
}

variable "region" {
  type        = string
  description = "Region ID where the Cloud Zone is created"
}

variable "description" {
  type        = string
  description = "Description of the Cloud Zone"
  default     = null
}

variable "compute_ids" {
  type        = list(string)
  description = "List of compute IDs (clusters, hosts, etc.) to associate with the Cloud Zone"
  default     = []
  validation {
    condition = !(
      length(var.compute_ids) > 0 &&
      length(var.tags_to_match) > 0
    )
    error_message = "Only one of compute_ids or tags_to_match may be set. Leave both empty or set exactly one."
  }
}

variable "capability_tags" {
  type        = list(map(string))
  description = "Capability tags to be applied to the Cloud Zone"
  default     = []
}

variable "tags_to_match" {
  type        = list(map(string))
  description = "Tags to match for filtering clusters"
  default     = []
}

variable "placement_policy" {
  type        = string
  description = "Placement policy for the Cloud Zone"
  default     = "DEFAULT"
}

variable "folder" {
  type        = string
  description = "The folder relative path to the datacenter where resources are deployed (vSphere only)"
  default     = null
}

variable "custom_properties" {
  type        = map(string)
  description = "Custom properties to apply to the Cloud Zone"
  default     = {}
}
