resource "oci_logging_unified_agent_configuration" "this" {
  compartment_id = var.compartment_id
  defined_tags   = var.defined_tags
  description    = var.description
  display_name   = var.display_name
  freeform_tags  = var.freeform_tags
  is_enabled     = var.is_enabled
  dynamic "group_association" {
    for_each = var.group_association[*]
    iterator = ga
    content {
      group_list = ga.value.group_list
    }
  }
  service_configuration {
    configuration_type = var.service_configuration.configuration_type
    dynamic "application_configurations" {
      for_each = var.service_configuration.application_configurations != null ? var.service_configuration.application_configurations : []
      iterator = ac
      content {
        source_type = ac.value.source_type
        destination {
          compartment_id    = ac.value.destination.compartment_id
          metrics_namespace = ac.value.destination.metrics_namespace
        }
        dynamic "source" {
          for_each = ac.value.source[*]
          iterator = so
          content {
            name = so.value.name
            dynamic "scrape_targets" {
              for_each = so.value.scrape_targets != null ? so.value.scrape_targets : []
              iterator = st
              content {
                k8s_namespace  = st.value.k8s_namespace
                name           = st.value.name
                resource_group = st.value.resource_group
                resource_type  = st.value.resource_type
                service_name   = st.value.service_name
                url            = st.value.url
              }
            }
          }
        }
        dynamic "sources" {
          for_each = ac.value.sources != null ? ac.value.sources : []
          iterator = so
          content {
            name        = so.value.name
            paths       = so.value.paths
            source_type = so.value.source_type
            dynamic "advanced_options" {
              for_each = so.value.advanced_options[*]
              iterator = ao
              content {
                is_read_from_head = ao.value.is_read_from_head
              }
            }
            dynamic "parser" {
              for_each = so.value.parser[*]
              iterator = pa
              content {
                delimiter                  = pa.value.delimiter
                expression                 = pa.value.expression
                field_time_key             = pa.value.field_time_key
                format                     = pa.value.format
                format_firstline           = pa.value.format_firstline
                grok_failure_key           = pa.value.grok_failure_key
                grok_name_key              = pa.value.grok_name_key
                is_estimate_current_event  = pa.value.is_estimate_current_event
                is_keep_time_key           = pa.value.is_keep_time_key
                is_merge_cri_fields        = pa.value.is_merge_cri_fields
                is_null_empty_string       = pa.value.is_null_empty_string
                is_support_colonless_ident = pa.value.is_support_colonless_ident
                is_with_priority           = pa.value.is_with_priority
                keys                       = pa.value.keys
                message_format             = pa.value.message_format
                message_key                = pa.value.message_key
                multi_line_start_regexp    = pa.value.multi_line_start_regexp
                null_value_pattern         = pa.value.null_value_pattern
                parse_nested               = pa.value.parse_nested
                parser_type                = pa.value.parser_type
                rfc5424time_format         = pa.value.rfc5424time_format
                separator                  = pa.value.separator
                syslog_parser_type         = pa.value.syslog_parser_type
                time_format                = pa.value.time_format
                time_type                  = pa.value.time_type
                timeout_in_milliseconds    = pa.value.timeout_in_milliseconds
                types                      = pa.value.types
                dynamic "nested_parser" {
                  for_each = pa.value.nested_parser[*]
                  iterator = np
                  content {
                    field_time_key   = np.value.field_time_key
                    is_keep_time_key = np.value.is_keep_time_key
                    parse_nested     = np.value.parse_nested
                    separator        = np.value.separator
                    time_format      = np.value.time_format
                    time_type        = np.value.time_type
                  }
                }
                dynamic "patterns" {
                  for_each = pa.value.patterns != null ? pa.value.patterns : []
                  iterator = pa
                  content {
                    field_time_format = pa.value.field_time_format
                    field_time_key    = pa.value.field_time_key
                    field_time_zone   = pa.value.field_time_zone
                    name              = pa.value.name
                    pattern           = pa.value.pattern
                  }
                }
                dynamic "record_input" {
                  for_each = pa.value.record_input[*]
                  iterator = ri
                  content {
                    dimensions     = ri.value.dimensions
                    namespace      = ri.value.namespace
                    resource_group = ri.value.resource_group
                  }
                }
              }
            }
          }
        }
        dynamic "unified_agent_configuration_filter" {
          for_each = ac.value.unified_agent_configuration_filter[*]
          iterator = uacf
          content {
            allow_list  = uacf.value.allow_list
            deny_list   = uacf.value.deny_list
            filter_type = uacf.value.filter_type
            name        = uacf.value.name
          }
        }
      }
    }
    dynamic "destination" {
      for_each = var.service_configuration.destination[*]
      iterator = de
      content {
        log_object_id = de.value.log_object_id
        dynamic "operational_metrics_configuration" {
          for_each = de.value.operational_metrics_configuration[*]
          iterator = omc
          content {
            destination {
              compartment_id = omc.value.destination.compartment_id
            }
            source {
              metrics = omc.value.source.metrics
              type    = omc.value.source.type
              record_input {
                namespace      = omc.value.source.record_input.namespace
                resource_group = omc.value.source.record_input.resource_group
              }
            }
          }
        }
      }
    }
    dynamic "sources" {
      for_each = var.service_configuration.sources != null ? var.service_configuration.sources : []
      iterator = so
      content {
        channels      = so.value.channels
        custom_plugin = so.value.custom_plugin
        name          = so.value.name
        paths         = so.value.paths
        source_type   = so.value.source_type
        dynamic "advanced_options" {
          for_each = so.value.advanced_options[*]
          iterator = ao
          content {
            is_read_from_head = ao.value.is_read_from_head
          }
        }
        dynamic "parser" {
          for_each = so.value.parser[*]
          iterator = pa
          content {
            delimiter                  = pa.value.delimiter
            expression                 = pa.value.expression
            field_time_key             = pa.value.field_time_key
            format                     = pa.value.format
            format_firstline           = pa.value.format_firstline
            grok_failure_key           = pa.value.grok_failure_key
            grok_name_key              = pa.value.grok_name_key
            is_estimate_current_event  = pa.value.is_estimate_current_event
            is_keep_time_key           = pa.value.is_keep_time_key
            is_merge_cri_fields        = pa.value.is_merge_cri_fields
            is_null_empty_string       = pa.value.is_null_empty_string
            is_support_colonless_ident = pa.value.is_support_colonless_ident
            is_with_priority           = pa.value.is_with_priority
            keys                       = pa.value.keys
            message_format             = pa.value.message_format
            message_key                = pa.value.message_key
            multi_line_start_regexp    = pa.value.multi_line_start_regexp
            null_value_pattern         = pa.value.null_value_pattern
            parse_nested               = pa.value.parse_nested
            parser_type                = pa.value.parser_type
            rfc5424time_format         = pa.value.rfc5424time_format
            separator                  = pa.value.separator
            syslog_parser_type         = pa.value.syslog_parser_type
            time_format                = pa.value.time_format
            time_type                  = pa.value.time_type
            timeout_in_milliseconds    = pa.value.timeout_in_milliseconds
            types                      = pa.value.types
            dynamic "nested_parser" {
              for_each = pa.value.nested_parser[*]
              iterator = np
              content {
                field_time_key   = np.value.field_time_key
                is_keep_time_key = np.value.is_keep_time_key
                parse_nested     = np.value.parse_nested
                separator        = np.value.separator
                time_format      = np.value.time_format
                time_type        = np.value.time_type
              }
            }
            dynamic "patterns" {
              for_each = pa.value.patterns != null ? pa.value.patterns : []
              iterator = pa
              content {
                field_time_format = pa.value.field_time_format
                field_time_key    = pa.value.field_time_key
                field_time_zone   = pa.value.field_time_zone
                name              = pa.value.name
                pattern           = pa.value.pattern
              }
            }
            dynamic "record_input" {
              for_each = pa.value.record_input[*]
              iterator = ri
              content {
                dimensions     = ri.value.dimensions
                namespace      = ri.value.namespace
                resource_group = ri.value.resource_group
              }
            }
          }
        }
      }
    }
    dynamic "unified_agent_configuration_filter" {
      for_each = var.service_configuration.unified_agent_configuration_filter != null ? var.service_configuration.unified_agent_configuration_filter : []
      iterator = uacf
      content {
        custom_filter_type           = uacf.value.custom_filter_type
        emit_invalid_record_to_error = uacf.value.emit_invalid_record_to_error
        filter_type                  = uacf.value.filter_type
        hash_value_field             = uacf.value.hash_value_field
        inject_key_prefix            = uacf.value.inject_key_prefix
        is_auto_typecast_enabled     = uacf.value.is_auto_typecast_enabled
        is_renew_record_enabled      = uacf.value.is_renew_record_enabled
        is_ruby_enabled              = uacf.value.is_ruby_enabled
        keep_keys                    = uacf.value.keep_keys
        key_name                     = uacf.value.key_name
        name                         = uacf.value.name
        params                       = uacf.value.params
        remove_key_name_field        = uacf.value.remove_key_name_field
        remove_keys                  = uacf.value.remove_keys
        renew_time_key               = uacf.value.renew_time_key
        replace_invalid_sequence     = uacf.value.replace_invalid_sequence
        reserve_data                 = uacf.value.reserve_data
        reserve_time                 = uacf.value.reserve_time
        dynamic "allow_list" {
          for_each = uacf.value.allow_list != null ? uacf.value.allow_list : []
          iterator = al
          content {
            key     = al.value.key
            pattern = al.value.pattern
          }
        }
        dynamic "custom_sections" {
          for_each = uacf.value.custom_sections != null ? uacf.value.custom_sections : []
          iterator = cs
          content {
            name   = cs.value.name
            params = cs.value.params
          }
        }
        dynamic "deny_list" {
          for_each = uacf.value.deny_list != null ? uacf.value.deny_list : []
          iterator = dl
          content {
            key     = dl.value.key
            pattern = dl.value.pattern
          }
        }
        dynamic "parser" {
          for_each = uacf.value.parser[*]
          iterator = pa
          content {
            delimiter                  = pa.value.delimiter
            expression                 = pa.value.expression
            field_time_key             = pa.value.field_time_key
            format                     = pa.value.format
            format_firstline           = pa.value.format_firstline
            grok_failure_key           = pa.value.grok_failure_key
            grok_name_key              = pa.value.grok_name_key
            is_estimate_current_event  = pa.value.is_estimate_current_event
            is_keep_time_key           = pa.value.is_keep_time_key
            is_merge_cri_fields        = pa.value.is_merge_cri_fields
            is_null_empty_string       = pa.value.is_null_empty_string
            is_support_colonless_ident = pa.value.is_support_colonless_ident
            is_with_priority           = pa.value.is_with_priority
            keys                       = pa.value.keys
            message_format             = pa.value.message_format
            message_key                = pa.value.message_key
            multi_line_start_regexp    = pa.value.multi_line_start_regexp
            null_value_pattern         = pa.value.null_value_pattern
            parse_nested               = pa.value.parse_nested
            parser_type                = pa.value.parser_type
            rfc5424time_format         = pa.value.rfc5424time_format
            separator                  = pa.value.separator
            syslog_parser_type         = pa.value.syslog_parser_type
            time_format                = pa.value.time_format
            time_type                  = pa.value.time_type
            timeout_in_milliseconds    = pa.value.timeout_in_milliseconds
            types                      = pa.value.types
            dynamic "nested_parser" {
              for_each = pa.value.nested_parser[*]
              iterator = np
              content {
                field_time_key   = np.value.field_time_key
                is_keep_time_key = np.value.is_keep_time_key
                parse_nested     = np.value.parse_nested
                separator        = np.value.separator
                time_format      = np.value.time_format
                time_type        = np.value.time_type
              }
            }
            dynamic "patterns" {
              for_each = pa.value.patterns != null ? pa.value.patterns : []
              iterator = pa
              content {
                field_time_format = pa.value.field_time_format
                field_time_key    = pa.value.field_time_key
                field_time_zone   = pa.value.field_time_zone
                name              = pa.value.name
                pattern           = pa.value.pattern
              }
            }
            dynamic "record_input" {
              for_each = pa.value.record_input[*]
              iterator = ri
              content {
                dimensions     = ri.value.dimensions
                namespace      = ri.value.namespace
                resource_group = ri.value.resource_group
              }
            }
          }
        }
        dynamic "record_list" {
          for_each = uacf.value.record_list != null ? uacf.value.record_list : []
          iterator = rl
          content {
            key   = rl.value.key
            value = rl.value.value
          }
        }
      }
    }
  }
}
