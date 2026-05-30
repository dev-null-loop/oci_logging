output "id" {
  description = "The OCID of the log saved search."
  value       = oci_logging_log_saved_search.this.id
}

output "state" {
  description = "The current state of the log saved search."
  value       = oci_logging_log_saved_search.this.state
}

output "time_created" {
  description = "The date and time the log saved search was created, expressed in RFC 3339 timestamp format."
  value       = oci_logging_log_saved_search.this.time_created
}

output "time_last_modified" {
  description = "The date and time the log saved search was last modified, expressed in RFC 3339 timestamp format."
  value       = oci_logging_log_saved_search.this.time_last_modified
}
