##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

locals {
  names = {
    for key, value in try(var.settings.parameters, {}) : key => try(value.name_override, "") != "" ? value.name_override : format("%s/%s", local.secret_store_path, value.name)
  }
}

resource "aws_ssm_parameter" "this" {
  for_each        = try(var.settings.parameters, {})
  name            = local.names[each.key]
  description     = try(each.value.description, "Default parameter for ${local.names[each.key]}")
  type            = try(each.value.type, "String")
  value           = each.value.value
  allowed_pattern = try(each.value.allowed_pattern, null)
  overwrite       = try(each.value.overwrite, false)
  tier            = try(each.value.tier, null)
  data_type       = try(each.value.data_type, null)
  key_id          = try(each.value.type, "String") == "SecureString" ? try(each.value.kms_key_id, var.settings.encryption.kms_key_id, data.aws_kms_alias.this[0].target_key_id, null) : null
  tags = merge(local.all_tags, try(each.value.extra_tags, {}), {
    Name = local.names[each.key]
  })
}