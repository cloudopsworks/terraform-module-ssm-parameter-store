##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

# settings:                                     # (Optional) Root configuration block for the SSM Parameter Store module. Default: {}
#   parameters:                                 # (Optional) Map of SSM parameters to create. Keys are internal identifiers. Default: {}
#     <key>:                                    # (Required) Unique key name used internally to identify this parameter entry.
#       name: "my-param"                        # (Required) Parameter name segment. Automatically prefixed with /<org_unit>/<env_name>/<env_type>/ to form the full path.
#       name_override: ""                       # (Optional) Full SSM path override. When set, skips automatic path construction entirely. Default: ""
#       description: "My parameter"             # (Optional) Human-readable description of the parameter. Default: "Default parameter for <resolved-name>"
#       type: "String"                          # (Optional) Parameter type. Possible values: "String", "StringList", "SecureString". Default: "String"
#       value: "my-value"                       # (Required) The value to store in the parameter.
#       allowed_pattern: ".*"                   # (Optional) Regex pattern that the value must match. Default: null (no validation)
#       overwrite: false                        # (Optional) Whether to overwrite an existing parameter at the same path. Default: false
#       tier: "Standard"                        # (Optional) Storage tier. Possible values: "Standard", "Advanced", "Intelligent-Tiering". Default: null (AWS selects automatically)
#       data_type: "text"                       # (Optional) Data type for the value. Possible values: "text", "aws:ec2:image". Default: null
#       kms_key_id: ""                          # (Optional) KMS key ID or ARN to use for this specific SecureString parameter. Overrides the global encryption.kms_key_id. Default: null
#       extra_tags:                             # (Optional) Additional resource tags merged into this parameter's tags. Default: {}
#         Tag1: "Value1"                        # (Optional) Example tag key-value pair.
#   encryption:                                 # (Optional) Global KMS encryption settings applied to all SecureString parameters unless overridden per-parameter. Default: {}
#     kms_key_alias: "alias/my-key"             # (Optional) KMS alias to resolve to a target key ID. Used when kms_key_id is not provided. Example: "alias/aws/ssm". Default: ""
#     kms_key_id: ""                            # (Optional) KMS key ID or ARN to use globally for all SecureString parameters. Overridden by parameters[<key>].kms_key_id. Default: ""
variable "settings" {
  description = "Settings for the module. See documentation for details."
  type        = any
  default     = {}
}