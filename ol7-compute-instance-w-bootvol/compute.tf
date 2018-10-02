resource "oci_core_instance" "PetersInstance" {
  #availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
  availability_domain = "${var.pk_availability_domain_name}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "PetersInstance"
  shape               = "${var.pk_InstanceShape}"

  create_vnic_details {
    subnet_id        = "${oci_core_subnet.ExampleSubnet.id}"
    display_name     = "primaryvnic"
    assign_public_ip = true
    hostname_label   = "tfexampleinstance"
  }

#  source_details {
#    source_type = "image"
#	source_id = "${var.instance_image_ocid[var.region]}"
#  }

  source_details {
    source_type = "bootVolume"
    source_id = "${var.boot_volume_id}"
  }

  preserve_boot_volume = true

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
  }

  timeouts {
    create = "60m"
  }
}
