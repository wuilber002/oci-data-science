#-------------------------------
# Object Storage Buckets
#-------------------------------
resource "oci_objectstorage_bucket" "buckets" {
  for_each           = toset(local.bucket_names)
  name               = "${var.project_name}-${each.key}"
  compartment_id     = var.project_compartment
  namespace          = local.namespace
  storage_tier       = "Standard"
  access_type        = "NoPublicAccess"
  freeform_tags      = local.tags
}