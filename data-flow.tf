#-------------------------------
# Data Flow Application
#-------------------------------
resource "oci_dataflow_application" "dataflow_app" {
  compartment_id  = var.project_compartment
  display_name    = "${var.project_name}-dataflow-app"
  language        = var.df_language
  spark_version   = var.df_spark_version
  num_executors   = var.df_num_executors
  logs_bucket_uri = local.logs_bucket_uri
  type            = "SESSION"

  driver_shape    = var.df_shape_name
  driver_shape_config {
    ocpus         = var.df_shape_config_ocpu
    memory_in_gbs = var.df_shape_config_memory_in_gbs
  }

  executor_shape  = var.df_shape_name
  executor_shape_config {
    ocpus         = var.df_shape_config_ocpu
    memory_in_gbs = var.df_shape_config_memory_in_gbs
  }
  configuration   = {
    "spark.oracle.datasource.enabled" = true
  }
  freeform_tags = local.tags
}

#-------------------------------
# Data Flow Run
#-------------------------------
resource "oci_dataflow_invoke_run" "dataflow_run" {
  application_id = oci_dataflow_application.dataflow_app.id
  compartment_id = var.project_compartment
  display_name   = "${var.project_name}-dataflow-run"
  depends_on     = [oci_objectstorage_bucket.buckets]
}