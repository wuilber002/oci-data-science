#-------------------------------
# Data Source Get Storage Namespace
#-------------------------------
data "oci_objectstorage_namespace" "ns" {
  compartment_id = var.compartment_ocid
}
