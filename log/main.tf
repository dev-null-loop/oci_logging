resource "oci_logging_log" "this" {
  display_name = var.display_name
  log_group_id = var.log_group_id
  log_type     = var.log_type

  dynamic "configuration" {
    for_each = var.configuration[*]
    iterator = c
    content {
      source {
	category    = c.value.category
	resource    = c.value.resource
	service     = c.value.service
	source_type = c.value.source_type
	parameters  = c.value.parameters
      }
      compartment_id = c.value.compartment_id
    }
  }
  defined_tags       = var.defined_tags
  freeform_tags      = var.freeform_tags
  is_enabled         = var.is_enabled
  retention_duration = var.retention_duration
}
