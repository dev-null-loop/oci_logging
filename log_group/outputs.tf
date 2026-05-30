output "id" {
  description = "The OCID of the resource"
  value       = oci_logging_log_group.this.id
}

output "state" {
  description = "The current state of the log group."
  value       = oci_logging_log_group.this.state
}

output "time_created" {
  description = "The date and time the log group was created, expressed in RFC 3339 timestamp format."
  value       = oci_logging_log_group.this.time_created
}

output "time_last_modified" {
  description = "The date and time the log group was last modified, expressed in RFC 3339 timestamp format."
  value       = oci_logging_log_group.this.time_last_modified
}
