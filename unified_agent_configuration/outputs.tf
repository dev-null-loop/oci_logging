output "configuration_state" {
  description = "The configuration state of the unified agent configuration."
  value       = oci_logging_unified_agent_configuration.this.configuration_state
}

output "id" {
  description = "The OCID of the unified agent configuration."
  value       = oci_logging_unified_agent_configuration.this.id
}

output "state" {
  description = "The current state of the unified agent configuration."
  value       = oci_logging_unified_agent_configuration.this.state
}

output "time_created" {
  description = "The date and time the unified agent configuration was created, expressed in RFC 3339 timestamp format."
  value       = oci_logging_unified_agent_configuration.this.time_created
}

output "time_last_modified" {
  description = "The date and time the unified agent configuration was last modified, expressed in RFC 3339 timestamp format."
  value       = oci_logging_unified_agent_configuration.this.time_last_modified
}
