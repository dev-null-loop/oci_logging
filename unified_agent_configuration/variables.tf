variable "compartment_id" {
  description = "(Required) (Updatable) The OCID of the compartment that the resource belongs to."
  type        = string
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).  Example: `{\"Operations.CostCenter\": \"42\"}`"
  type        = map(string)
  default     = null
}

variable "description" {
  description = "(Required) (Updatable) Description for this resource."
  type        = string
}

variable "display_name" {
  description = "(Required) (Updatable) The user-friendly display name. This must be unique within the enclosing resource, and it's changeable. Avoid entering confidential information."
  type        = string
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm). Example: `{\"Department\": \"Finance\"}`"
  type        = map(string)
  default     = {}
}

variable "group_association" {
  description = "(Optional) (Updatable) Groups using the configuration."
  type = object({
    group_list = optional(list(string))
  })
  default = null
}

variable "is_enabled" {
  description = "(Required) (Updatable) Whether or not this resource is currently enabled."
  type        = bool
}

variable "service_configuration" {
  description = "(Required) (Updatable) Top level Unified Agent service configuration object."
  type = object({
    configuration_type = string
    application_configurations = optional(list(object({
      source_type = string
      destination = object({
        compartment_id    = optional(string)
        metrics_namespace = optional(string)
      })
      source = optional(object({
        name = optional(string)
        scrape_targets = optional(list(object({
          k8s_namespace  = optional(string)
          name           = optional(string)
          resource_group = optional(string)
          resource_type  = optional(string)
          service_name   = optional(string)
          url            = optional(string)
        })))
      }))
      sources = optional(list(object({
        name        = optional(string)
        paths       = optional(list(string))
        source_type = optional(string)
        advanced_options = optional(object({
          is_read_from_head = optional(bool)
        }))
        parser = optional(object({
          delimiter                  = optional(string)
          expression                 = optional(string)
          field_time_key             = optional(string)
          format                     = optional(list(string))
          format_firstline           = optional(string)
          grok_failure_key           = optional(string)
          grok_name_key              = optional(string)
          is_estimate_current_event  = optional(bool)
          is_keep_time_key           = optional(bool)
          is_merge_cri_fields        = optional(bool)
          is_null_empty_string       = optional(bool)
          is_support_colonless_ident = optional(bool)
          is_with_priority           = optional(bool)
          keys                       = optional(list(string))
          message_format             = optional(string)
          message_key                = optional(string)
          multi_line_start_regexp    = optional(string)
          null_value_pattern         = optional(string)
          parse_nested               = optional(bool)
          parser_type                = string
          rfc5424time_format         = optional(string)
          separator                  = optional(string)
          syslog_parser_type         = optional(string)
          time_format                = optional(string)
          time_type                  = optional(string)
          timeout_in_milliseconds    = optional(number)
          types                      = optional(map(string))
          nested_parser = optional(object({
            field_time_key   = optional(string)
            is_keep_time_key = optional(bool)
            parse_nested     = optional(bool)
            separator        = optional(string)
            time_format      = optional(string)
            time_type        = optional(string)
          }))
          patterns = optional(list(object({
            field_time_format = optional(string)
            field_time_key    = optional(string)
            field_time_zone   = optional(string)
            name              = optional(string)
            pattern           = optional(string)
          })))
          record_input = optional(object({
            dimensions     = optional(map(string))
            namespace      = optional(string)
            resource_group = optional(string)
          }))
        }))
      })))
      unified_agent_configuration_filter = optional(object({
        allow_list  = optional(list(string))
        deny_list   = optional(list(string))
        filter_type = optional(string)
        name        = optional(string)
      }))
    })))
    destination = optional(object({
      log_object_id = string
      operational_metrics_configuration = optional(object({
        destination = object({
          compartment_id = string
        })
        source = object({
          metrics = optional(list(string))
          type    = string
          record_input = object({
            namespace      = string
            resource_group = optional(string)
          })
        })
      }))
    }))
    sources = optional(list(object({
      channels      = optional(list(string))
      custom_plugin = optional(string)
      name          = optional(string)
      paths         = optional(list(string))
      source_type   = string
      advanced_options = optional(object({
        is_read_from_head = optional(bool)
      }))
      parser = optional(object({
        delimiter                  = optional(string)
        expression                 = optional(string)
        field_time_key             = optional(string)
        format                     = optional(list(string))
        format_firstline           = optional(string)
        grok_failure_key           = optional(string)
        grok_name_key              = optional(string)
        is_estimate_current_event  = optional(bool)
        is_keep_time_key           = optional(bool)
        is_merge_cri_fields        = optional(bool)
        is_null_empty_string       = optional(bool)
        is_support_colonless_ident = optional(bool)
        is_with_priority           = optional(bool)
        keys                       = optional(list(string))
        message_format             = optional(string)
        message_key                = optional(string)
        multi_line_start_regexp    = optional(string)
        null_value_pattern         = optional(string)
        parse_nested               = optional(bool)
        parser_type                = string
        rfc5424time_format         = optional(string)
        separator                  = optional(string)
        syslog_parser_type         = optional(string)
        time_format                = optional(string)
        time_type                  = optional(string)
        timeout_in_milliseconds    = optional(number)
        types                      = optional(map(string))
        nested_parser = optional(object({
          field_time_key   = optional(string)
          is_keep_time_key = optional(bool)
          parse_nested     = optional(bool)
          separator        = optional(string)
          time_format      = optional(string)
          time_type        = optional(string)
        }))
        patterns = optional(list(object({
          field_time_format = optional(string)
          field_time_key    = optional(string)
          field_time_zone   = optional(string)
          name              = optional(string)
          pattern           = optional(string)
        })))
        record_input = optional(object({
          dimensions     = optional(map(string))
          namespace      = optional(string)
          resource_group = optional(string)
        }))
      }))
    })))
    unified_agent_configuration_filter = optional(list(object({
      custom_filter_type           = optional(string)
      emit_invalid_record_to_error = optional(bool)
      filter_type                  = string
      hash_value_field             = optional(string)
      inject_key_prefix            = optional(string)
      is_auto_typecast_enabled     = optional(bool)
      is_renew_record_enabled      = optional(bool)
      is_ruby_enabled              = optional(bool)
      keep_keys                    = optional(list(string))
      key_name                     = optional(string)
      name                         = string
      params                       = optional(map(string))
      remove_key_name_field        = optional(bool)
      remove_keys                  = optional(list(string))
      renew_time_key               = optional(string)
      replace_invalid_sequence     = optional(bool)
      reserve_data                 = optional(bool)
      reserve_time                 = optional(bool)
      allow_list = optional(list(object({
        key     = optional(string)
        pattern = optional(string)
      })))
      custom_sections = optional(list(object({
        name   = optional(string)
        params = optional(map(string))
      })))
      deny_list = optional(list(object({
        key     = optional(string)
        pattern = optional(string)
      })))
      parser = optional(object({
        delimiter                  = optional(string)
        expression                 = optional(string)
        field_time_key             = optional(string)
        format                     = optional(list(string))
        format_firstline           = optional(string)
        grok_failure_key           = optional(string)
        grok_name_key              = optional(string)
        is_estimate_current_event  = optional(bool)
        is_keep_time_key           = optional(bool)
        is_merge_cri_fields        = optional(bool)
        is_null_empty_string       = optional(bool)
        is_support_colonless_ident = optional(bool)
        is_with_priority           = optional(bool)
        keys                       = optional(list(string))
        message_format             = optional(string)
        message_key                = optional(string)
        multi_line_start_regexp    = optional(string)
        null_value_pattern         = optional(string)
        parse_nested               = optional(bool)
        parser_type                = string
        rfc5424time_format         = optional(string)
        separator                  = optional(string)
        syslog_parser_type         = optional(string)
        time_format                = optional(string)
        time_type                  = optional(string)
        timeout_in_milliseconds    = optional(number)
        types                      = optional(map(string))
        nested_parser = optional(object({
          field_time_key   = optional(string)
          is_keep_time_key = optional(bool)
          parse_nested     = optional(bool)
          separator        = optional(string)
          time_format      = optional(string)
          time_type        = optional(string)
        }))
        patterns = optional(list(object({
          field_time_format = optional(string)
          field_time_key    = optional(string)
          field_time_zone   = optional(string)
          name              = optional(string)
          pattern           = optional(string)
        })))
        record_input = optional(object({
          dimensions     = optional(map(string))
          namespace      = optional(string)
          resource_group = optional(string)
        }))
      }))
      record_list = optional(list(object({
        key   = optional(string)
        value = optional(string)
      })))
    })))
  })
}
