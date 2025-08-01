#-------------------------------
# Outputs
#-------------------------------
output "bucket_ocids" {
  description = "OCIDs of the created Object Storage buckets"
  value = {
    for name, bucket in oci_objectstorage_bucket.buckets :
    name => bucket.id
  }
}
output "adb_prod_ocid" {
  description = "OCID of the Autonomous Database (PROD)"
  value       = oci_database_autonomous_database.adb_prod.id
}
output "ds_project_ocid" {
  description = "OCID of the Data Science project"
  value       = oci_datascience_project.ds_project.id
}
output "ds_notebook_ocid" {
  description = "OCID of the Data Science notebook session"
  value       = oci_datascience_notebook_session.ds_notebook.id
}
output "dataflow_app_ocid" {
  description = "OCID of the Data Flow application"
  value       = oci_dataflow_application.dataflow_app.id
}
output "dataflow_run_ocid" {
  description = "OCID of the Data Flow run"
  value       = oci_dataflow_invoke_run.dataflow_run.id
}