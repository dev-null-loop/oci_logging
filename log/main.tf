data "oci_logging_logs" "these" {
  log_group_id    = var.log_group_id
  display_name    = var.display_name
  log_type        = var.log_type
  source_resource = var.source_resource
  source_service  = var.source_service
  state           = var.state
}

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
  lifecycle {
    precondition {
      condition     = !(length(data.oci_logging_logs.these.logs) > 0)
      error_message = "Error: A log in the log group already uses this display name. Use a different name. or A log already exists for this combination of service, resource, and category. Create a log for a unique combination."
    }
  }
}
