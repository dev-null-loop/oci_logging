output "id" {
  description = "The OCID of the resource."
  value       = oci_logging_log.this.id
}

output "validate_configuration" {
  value = null
  precondition {
    condition     = contains(var.logging_services, var.configuration.service)
    error_message = "Error: incorrect service name"
  }
  precondition {
    condition     = contains(var.logging_categories, var.configuration.category)
    error_message = "Error: incorrect service category"
  }
}
