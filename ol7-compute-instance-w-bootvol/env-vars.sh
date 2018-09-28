#!/bin/bash
#Authentication details
export TF_VAR_tenancy_ocid="ocid1.tenancy.oc1..aaaaaaaajccl7okjwfkjp5t4dxdvzjyzixvpiyoo45xaxwtzl226czz6gfsq"
export TF_VAR_user_ocid="ocid1.user.oc1..aaaaaaaac4qrtato4e7pufbkorxkgs6ueh7j3mbs237xhyy5fynon2xmmi4q"
export TF_VAR_fingerprint="1d:3f:d1:6b:44:79:e5:2d:db:10:67:88:66:87:db:c1"
export TF_VAR_private_key_path="/mnt/c/Users/PEKARLSS/Documents/GitHub/Terraform-OCI-Demos/ol7-compute-instance-w-bootvol/.oci/oci_api_key.pem"

#Region
export TF_VAR_region="eu-frankfurt-1"

#Compartment
export TF_VAR_compartment_ocid="ocid1.compartment.oc1..aaaaaaaa4qkenymfoumszv5gs2am6rsciozq7zvlirhmfw2riwuurv45cwua"

export TF_VAR_pk_availability_domain_name="RNnO:EU-FRANKFURT-1-AD-1"

#Public/private keys used on the instance
export TF_VAR_ssh_public_key=$(cat ~/.ssh/id_rsa.pub)
export TF_VAR_ssh_private_key=$(cat ~/.ssh/id_rsa)
