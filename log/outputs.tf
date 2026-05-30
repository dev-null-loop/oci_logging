output "id" {
  description = "The OCID of the resource."
  value       = oci_logging_log.this.id
}

output "compartment_id" {
  description = "The OCID of the compartment that the resource belongs to."
  value       = oci_logging_log.this.compartment_id
}

output "state" {
  description = "The current state of the log object."
  value       = oci_logging_log.this.state
}

output "tenancy_id" {
  description = "The OCID of the tenancy where the log exists."
  value       = oci_logging_log.this.tenancy_id
}

output "time_created" {
  description = "The date and time the log was created, expressed in RFC 3339 timestamp format."
  value       = oci_logging_log.this.time_created
}

output "time_last_modified" {
  description = "The date and time the log was last modified, expressed in RFC 3339 timestamp format."
  value       = oci_logging_log.this.time_last_modified
}
