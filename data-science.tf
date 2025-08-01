#-------------------------------
# Data Science Project
#-------------------------------
resource "oci_datascience_project" "ds_project" {
  compartment_id = var.project_compartment
  display_name   = "${var.project_name}-ds-project"
  freeform_tags  = local.tags
}

#-------------------------------
# Data Science Notebook Session
#-------------------------------
resource "oci_datascience_notebook_session" "ds_notebook" {
  compartment_id = var.project_compartment
  display_name   = "${var.project_name}-nb-project"
  project_id     = oci_datascience_project.ds_project.id
  notebook_session_config_details {
    shape = var.nb_shape_name
    notebook_session_shape_config_details {
      ocpus         = var.nb_shape_config_ocpu
      memory_in_gbs = var.nb_shape_config_memory_in_gbs
    }
  }
  notebook_session_runtime_config_details {
      custom_environment_variables = {
        NB_ONCREATE_SCRIPT_URL   = local.df_nb_session_url_script
        NB_ONACTIVATE_SCRIPT_URL = local.df_nb_session_url_script
        DATAFLOWAPP              = oci_dataflow_application.dataflow_app.id
        BUCKET_BRONZE            = "oci://${var.project_name}-bronze@${local.namespace}/"
        BUCKET_SILVER            = "oci://${var.project_name}-silver@${local.namespace}/"
        BUCKET_GOLD              = "oci://${var.project_name}-gold@${local.namespace}/"
        ADB_TNS                  = oci_database_autonomous_database.adb_prod.connection_strings.0.all_connection_strings["HIGH"]
        ADB_USERNAME             = "ADMIN"
        ADB_PASSWD               = var.adb_admin_password
      }
    }
  freeform_tags = local.tags
}