#-------------------------------
# Locals
#-------------------------------
locals {
  # Autonomous-database
  project_alpha    = replace(replace(var.project_name, "-", ""), "_", "")
  adb_db_name      = "${local.project_alpha}prod"
  adb_display_name = "${local.project_alpha}adbprod"

  # Data Flow
  logs_bucket_uri = "oci://${var.project_name}-df-logs@${local.namespace}/"
  ### lib_path_uri = "oci://${var.project_name}-df-lib@${local.namespace}/env.zip#env"

  # Data Science
  df_nb_session_url_script = "https://objectstorage.${var.region}.oraclecloud.com/n/${local.namespace}/b/${var.df_setup_bucket}/o/${var.df_setup_script}"

  # Object Storage: Bucket
  bucket_names = ["bronze", "silver", "gold", "df-lib", "df-logs", "df-scripts"]

  # General
  namespace    = data.oci_objectstorage_namespace.ns.namespace
  tags         = {
    "project"    = "${var.project_name}"
    "managed_by" = "terraform"
  }
}