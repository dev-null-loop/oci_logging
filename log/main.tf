resource "oci_logging_log" "this" {
  display_name       = var.display_name
  log_group_id       = var.log_group_id
  log_type           = var.log_type
  defined_tags       = var.defined_tags
  freeform_tags      = var.freeform_tags
  is_enabled         = var.is_enabled
  retention_duration = var.retention_duration

  configuration {
    source {
      category    = var.configuration.category
      resource    = var.configuration.resource
      service     = var.configuration.service
      source_type = var.configuration.source_type
      parameters  = var.configuration.parameters
    }
    compartment_id = var.configuration.compartment_id
  }
}
