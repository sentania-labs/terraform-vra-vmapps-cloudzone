variable "placement_policy" {
  type        = string
  description = "Placement policy for all cloud zones"
  default     = "DEFAULT"
}

variable "tags_to_match" {
  type = list(object({
    key   = string
    value = string
  }))
  description = "Tags to match for cluster selection"
  default     = []
}

variable "capability_tags" {
  type = list(object({
    key   = string
    value = string
  }))
  description = "Capability tags applied to cloud zones"
  default     = []
}

variable "folder" {
  type        = string
  description = "vSphere folder for the cloud zone (optional)"
  default     = null
}

variable "compute_ids" {
  type        = list(string)
  description = "Optional explicit compute IDs"
  default     = []
}

variable "custom_properties" {
  type        = map(string)
  description = "Optional custom properties"
  default     = {}
}
