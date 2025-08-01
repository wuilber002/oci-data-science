#-------------------------------
# Variables
#-------------------------------
variable "region" {}
variable "compartment_ocid" {}
variable "tenancy_ocid" {}

variable "project_name" {type=string}
variable "project_compartment" {type=string}
variable "adb_admin_password" {type=string}
variable "adb_subnet_id" {type=string}
variable "adb_license_model" {
  description = "The Oracle license model that applies to the Oracle Autonomous Database."
  type        = string
  default     = "LICENSE_INCLUDED"
}
variable "adb_whitelisted_ips" {
  description = "Autonomous Data Warehouse (ADW) whitelisted IPs. The client IP access control list (ACL)."
  type        = list
  default     = ["0.0.0.0/0"]
}
variable "adb_autonomous_maintenance_schedule_type" {
  description = "The maintenance schedule type of the Autonomous Database Serverless."
  type        = string
  default     = "REGULAR"
}
variable "adb_workload" {
  description = "Autonomous Data Warehouse (ADW) workload."
  type        = string
  default     = "DW"
}
variable "adb_version" {
  description = "A valid Oracle Database version for Autonomous Database."
  type        = string
  default     = "23ai"
}
variable "adb_compute_model" {
  description = "The compute model of the Autonomous Database."
  type        = string
  default     = "ECPU"
}
variable "adb_compute_count" {
  description = "Select 2 for High Availability"
  type        = number
  default     = 2
}
variable "adb_data_storage_size_in_tbs" {
  description = "Autonomous Data Warehouse (ADW) data storage size in terabytes."
  type        = number
  default     = 1
}
variable "adb_backup_retention_period_in_days" {
  description = "Autonomous Data Warehouse (ADW) Backup retention period in days."
  type        = number
  default     = 60
}
variable "adb_character_set" {
  description = "The character set for the autonomous database."
  type        = string
  default     = "AL32UTF8"
}
variable "adb_ncharacter_set" {
  description = "The ncharacter set for the autonomous database."
  type        = string
  default     = "AL16UTF16"
}
variable "adb_is_auto_scaling_enabled" {
  description = "Indicates if auto scaling is enabled for the Autonomous Database CPU core count."
  type        = bool
  default     = true
}
variable "adb_is_auto_scaling_for_storage_enabled" {
  description = "Indicates if auto scaling is enabled for the Autonomous Database storage."
  type        = bool
  default     = false
}
variable "adb_is_dedicated" {
  description = "Autonomous Database database is on dedicated Exadata infrastructure."
  type        = bool
  default     = false
}
variable "adb_is_mtls_connection_required" {
  description = "Specifies if the Autonomous Database requires mTLS connections."
  type        = bool
  default     = false
}

variable "nb_shape_name" {type=string}
variable "nb_shape_config_ocpu" {
  description = "You can customize the number of OCPUs to a flexible shape."
  type        = number
  default     = 1
}
variable "nb_shape_config_memory_in_gbs" {
  description = "You can customize the amount of memory allocated to a flexible shape."
  type        = number
  default     = 16
}

variable "df_shape_name" {}
variable "df_shape_config_ocpu" {
  description = "You can customize the number of OCPUs to a flexible shape."
  type        = number
  default     = 2
}
variable "df_shape_config_memory_in_gbs" {
  description = "You can customize the amount of memory allocated to a flexible shape."
  type        = number
  default     = 64
}
variable "df_language"{
  description = "Application Language for Data Flow"
  type        = string
  default     = "PYTHON"
}
variable "df_spark_version"{
  description = "Application Spark Version for Data Flow"
  type        = string
  default     = "3.5.0"
}
variable "df_num_executors"{
  description = "Number of Executors for Data Flow Application"
  type        = number
  default     = 1
}

variable "df_setup_bucket" {
  description = "Bucket name for Data Flow Setup. <strong>MAKE SURE THE BUCKET EXISTS BEFORE CONTINUING</strong>."
  type        = string
  default     = "dataflow-setup"
}
variable "df_setup_script" {
  description = "The name of script for Data Flow Setup. <strong>MAKE SURE FILE EXIST IN THE BUCKET SPECIFIED ABOVE</strong>."
  type        = string
  default     = "settingup_notebook.sh"
}