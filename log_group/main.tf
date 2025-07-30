data "oci_logging_log_groups" "these" {
  compartment_id               = var.compartment_id
  display_name                 = var.display_name
  is_compartment_id_in_subtree = var.is_compartment_id_in_subtree
}

resource "oci_logging_log_group" "this" {
  compartment_id = var.compartment_id
  display_name   = var.display_name
  defined_tags   = var.defined_tags
  description    = var.description
  freeform_tags  = var.freeform_tags
  # lifecycle {
  #   precondition {
  #     condition     = !(length(data.oci_logging_log_groups.these.log_groups) > 0)
  #     error_message = "Error: A log group in the compartment already uses this display name. Use a different name."
  #   }
  # }
}
