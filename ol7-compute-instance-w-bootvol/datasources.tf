# Gets a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

# Gets a list of all Oracle Linux 7.4 images that support a given Instance shape
data "oci_core_images" "TFSupportedShapeImages" {
  compartment_id           = "${var.tenancy_ocid}"
  shape                    = "${var.pk_InstanceShape}"
  operating_system         = "${var.ImageOS}"
  operating_system_version = "${var.ImageOSVersion}"
}
