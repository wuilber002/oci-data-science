#-------------------------------
# Autonomous Database - PROD
#-------------------------------
resource "oci_database_autonomous_database" "adb_prod" {
  admin_password                       = var.adb_admin_password
  autonomous_maintenance_schedule_type = var.adb_autonomous_maintenance_schedule_type
  backup_retention_period_in_days      = var.adb_backup_retention_period_in_days
  character_set                        = var.adb_character_set
  compartment_id                       = var.project_compartment
  compute_count                        = var.adb_compute_count
  compute_model                        = var.adb_compute_model
  data_storage_size_in_tbs             = var.adb_data_storage_size_in_tbs
  db_name                              = local.adb_db_name
  display_name                         = local.adb_display_name
  db_version                           = var.adb_version
  db_workload                          = var.adb_workload
  is_auto_scaling_enabled              = var.adb_is_auto_scaling_enabled
  is_auto_scaling_for_storage_enabled  = var.adb_is_auto_scaling_for_storage_enabled
  is_dedicated                         = var.adb_is_dedicated
  is_mtls_connection_required          = var.adb_is_mtls_connection_required
  license_model                        = var.adb_license_model
  ncharacter_set                       = var.adb_ncharacter_set
  subnet_id                            = var.adb_subnet_id
  whitelisted_ips                      = var.adb_whitelisted_ips
  freeform_tags                        = local.tags
}