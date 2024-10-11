variable "display_name" {
  description = "(Required) (Updatable) The user-friendly display name. This must be unique within the enclosing resource, and it's changeable. Avoid entering confidential information. "
  type        = string
}

variable "log_group_id" {
  description = "(Required) (Updatable) OCID of a log group to work with."
  type        = string
}

variable "log_type" {
  description = "(Required) The logType that the log object is for, whether custom or service."
  type        = string
  validation {
    condition     = contains(["CUSTOM", "SERVICE"], var.log_type)
    error_message = "Error: log type is: [CUSTOM, SERVICE]"
  }
}

variable "configuration" {
  description = "(Optional) Log object configuration."
  type = object({
    compartment_id = optional(string)
    category       = string
    resource       = string
    service        = string
    source_type    = string
    parameters     = optional(map(string))
  })
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)"
  type        = map(string)
  default     = null
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)."
  type        = map(string)
  default     = {}
}

variable "is_enabled" {
  description = "(Optional) (Updatable) Whether or not this resource is currently enabled."
  type        = bool
  default     = true
}

variable "retention_duration" {
  description = "(Optional) (Updatable) Log retention duration in 30-day increments (30, 60, 90 and so on until 180)."
  type        = number
  default     = 30
}

variable "logging_services" {
  description = "services that support logging"
  type        = list(string)
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
  description = "List of service categories"
  type        = list(string)
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
    "vcn",
    "vnic",
    "write"
  ]
}

variable "source_resource" {
  description = "(Optional) Log object resource, which is a field of LogSummary.Configuration.Source."
  type        = string
  default     = null
}

variable "source_service" {
  description = "(Optional) Service that created the log object, which is a field of LogSummary.Configuration.Source."
  type        = string
  default     = null
}

variable "state" {
  description = "(Optional) Lifecycle state of the log object"
  type        = string
  default     = "ACTIVE"
}
