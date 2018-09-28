resource "oci_core_instance" "TFInstance" {
  #availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
  availability_domain = "${var.pk_availability_domain_name}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "TFInstance"
  shape               = "${var.InstanceShape}"

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
    source_id = "ocid1.bootvolume.oc1.eu-frankfurt-1.abtheljsbutuwmjbncndhpqxtv6nnor33ahos2nb43ijwfr6bmyqbydhnkna"
  }

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
  }

  timeouts {
    create = "60m"
  }
}
