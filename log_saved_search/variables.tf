variable "compartment_id" {
  description = "(Required) (Updatable) The OCID of the compartment that the resource belongs to."
  type        = string
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).  Example: `{\"Operations.CostCenter\": \"42\"}`"
  type        = map(string)
  default     = null
}

variable "description" {
  description = "(Optional) (Updatable) Description for this resource."
  type        = string
  default     = null
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm). Example: `{\"Department\": \"Finance\"}`"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "(Required) (Updatable) The user-friendly display name. This must be unique within the enclosing resource, and it's changeable. Avoid entering confidential information."
  type        = string
}

variable "query" {
  description = "(Required) (Updatable) The search query that is saved."
  type        = string
}
