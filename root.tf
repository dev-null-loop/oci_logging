variable "log_group_ids" {
  type    = map(string)
  default = {}
}

variable "logging_services" {
  type = list(string)
  default = [
    "oacnativeproduction",
    "apigateway",
    "adm",
    "apm",
    "och",
    "oke-k8s-cp-prod",
    "dataflow",
    "dataintegration",
    "datascience",
    "devops",
    "emaildelivery",
    "cloudevents",
    "filestorage",
    "functions",
    "goldengate",
    "integration",
    "loadbalancer",
    "mediaflow",
    "ocinetworkfirewall",
    "objectstorage",
    "operatoraccessprod",
    "postgresql",
    "oci_c3_vpn",
    "flowlogs",
    "waa",
    "waf"
  ]
}

variable "logging_categories" {
  type = list(string)
  default = [
    "access",
    "activitystream",
    "all",
    "all-service-logs",
    "audit",
    "cloud-controller-manager",
    "diagnostic",
    "disworkspacelogs",
    "dropped-data",
    "error",
    "error_logs",
    "execution",
    "hypervisor_logs",
    "invoke",
    "kube-apiserver",
    "kube-controller-manager",
    "kube-scheduler",
    "nfslogs",
    "outboundaccepted",
    "outboundrelayed",
    "pipelinerunlog",
    "postgresql_database_logs",
    "process_logs",
    "read",
    "remediationrecipelogs",
    "ruleexecutionlog",
    "runlog",
    "subnet",
    "threatlog",
    "trafficlog",
    "tunnellog",
    "vcn",
    "vnic",
    "write"
  ]
}

variable "logs" {
  type = map(object({
    display_name   = string
    log_group_id   = optional(string)
    log_group_name = optional(string)
    log_type       = string
    configuration = optional(object({
      compartment_id = optional(string)
      category       = string
      parameters = optional(object({
	capture_filter        = optional(string)
	enablement_point_type = optional(string)
      }))
      resource    = string
      service     = string
      source_type = string
    }))
    defined_tags       = optional(map(string), null)
    freeform_tags      = optional(map(string), {})
    is_enabled         = optional(bool, true)
    retention_duration = optional(number, 30)
  }))
}

locals {
  resolved_log_group_ids = var.log_group_ids

  resolved_logs = {
    for name, log in var.logs : name => merge(log, {
      log_group_id = coalesce(
	try(log.log_group_id, null),
	try(local.resolved_log_group_ids[log.log_group_name], null)
      )
    })
  }
}

module "logs" {
  for_each = local.resolved_logs

  source = "git@github.com:dev-null-loop/oci_logging//log"

  display_name       = each.value.display_name
  log_group_id       = each.value.log_group_id
  log_type           = each.value.log_type
  configuration      = try(each.value.configuration, null)
  defined_tags       = each.value.defined_tags
  freeform_tags      = each.value.freeform_tags
  is_enabled         = each.value.is_enabled
  retention_duration = each.value.retention_duration

  providers = {
    oci = oci
  }
}

check "log_group_ids_resolved" {
  assert {
    condition = alltrue([
      for name, log in local.resolved_logs : try(log.log_group_id, null) != null
    ])
    error_message = "Each log must resolve to a log_group_id, either directly or through log_group_name -> var.log_group_ids."
  }
}

check "logging_service_known" {
  assert {
    condition = alltrue([
      for name, log in local.resolved_logs :
      try(log.configuration, null) == null || contains(var.logging_services, log.configuration.service)
    ])
    error_message = "One or more logs use an unknown logging service."
  }
}

check "logging_category_known" {
  assert {
    condition = alltrue([
      for name, log in local.resolved_logs :
      try(log.configuration, null) == null || contains(var.logging_categories, log.configuration.category)
    ])
    error_message = "One or more logs use an unknown logging category."
  }
}
