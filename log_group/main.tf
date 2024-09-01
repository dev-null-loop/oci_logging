resource "oci_logging_log_group" "this" {
  compartment_id = var.compartment_id
  display_name   = var.display_name
  defined_tags   = var.defined_tags
  description    = var.description
  freeform_tags  = var.freeform_tags
}
