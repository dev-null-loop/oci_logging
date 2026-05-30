resource "oci_logging_log_saved_search" "this" {
  compartment_id = var.compartment_id
  name           = var.name
  query          = var.query
  defined_tags   = var.defined_tags
  description    = var.description
  freeform_tags  = var.freeform_tags
}
