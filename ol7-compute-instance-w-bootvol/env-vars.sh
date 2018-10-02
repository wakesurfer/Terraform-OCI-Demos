#!/bin/bash
### Authentication details
export TF_VAR_tenancy_ocid="ocid1.tenancy.oc1..aaaaaaaajccl7okjwfkjp5t4dxdvzjyzixvpiyoo45xaxwtzl226czz6gfsq"
export TF_VAR_user_ocid="ocid1.user.oc1..aaaaaaaac4qrtato4e7pufbkorxkgs6ueh7j3mbs237xhyy5fynon2xmmi4q"
export TF_VAR_fingerprint="1d:3f:d1:6b:44:79:e5:2d:db:10:67:88:66:87:db:c1"
export TF_VAR_private_key_path="/mnt/c/Users/PEKARLSS/Documents/GitHub/Terraform-OCI-Demos/ol7-compute-instance-w-bootvol/.oci-api-keys/oci_api_key.pem"

### Compartment
export TF_VAR_compartment_ocid="ocid1.compartment.oc1..aaaaaaaa4qkenymfoumszv5gs2am6rsciozq7zvlirhmfw2riwuurv45cwua"

### Region specific settings
### Ashburn
#export TF_VAR_region="us-ashburn-1"
#export TF_VAR_pk_availability_domain_name="RNnO:US-ASHBURN-AD-1"
#export TF_VAR_boot_volume_id="ocid1.bootvolume.oc1.iad.abuwcljtuhfx7ycpglhbqy3b7vpdslkddmx6nk6pebiserjjyw4a7vsmpoka"
#export TF_VAR_pk_InstanceShape="VM.Standard1.1"

### Frankfurt
#export TF_VAR_region="eu-frankfurt-1"
#export TF_VAR_pk_availability_domain_name="RNnO:EU-FRANKFURT-1-AD-1"
#export TF_VAR_boot_volume_id="ocid1.bootvolume.oc1.eu-frankfurt-1.abtheljsuusjiiqrgu7nkbttrs64htcv7vegp7c6t25lkfzeeubsfydz34vq"
#export TF_VAR_pk_InstanceShape="VM.Standard1.1"

### London
export TF_VAR_region="uk-london-1"
export TF_VAR_pk_availability_domain_name="RNnO:UK-LONDON-1-AD-1"
export TF_VAR_boot_volume_id="ocid1.bootvolume.oc1.uk-london-1.abwgiljtfms6oknwiw4tsxsoot6y2d3n3disojhctupcqpvl7tf7zgsjublq"
export TF_VAR_pk_InstanceShape="VM.Standard2.1"

### Public/private keys used on the instance
export TF_VAR_ssh_public_key=$(cat ~/.ssh/id_rsa.pub)
export TF_VAR_ssh_private_key=$(cat ~/.ssh/id_rsa)
#export TF_VAR_ssh_public_key=$(cat /home/peter/.ssh/id_rsa.pub)
#export TF_VAR_ssh_private_key=$(cat /home/peter/.ssh/id_rsa)
