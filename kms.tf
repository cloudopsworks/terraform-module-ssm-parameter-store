##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

data "aws_kms_alias" "this" {
  count = try(var.settings.encryption.kms_key_alias, "") != "" ? 1 : 0
  name  = var.settings.encryption.kms_key_alias
}