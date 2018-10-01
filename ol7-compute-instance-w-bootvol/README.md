
----
# Work in Progress... #

# Terraform example for OCI Oracle Cloud Infrastructure #
## Creating an Oracle Linux 7.5 compute instance ##

## You need to ##
### Copy the .ssh folder to your home directory for ssh to be able to use your keys ###
### Update env-vars.sh to reflect your environment ###

### To change region ###
```
  In env-vars.sh
    Update TF_VAR_region
    Update TF_VAR_pk_availability_domain_name
  Source the environment
    . ./env-vars.sh

  In compute.tf
    Update source_id to point to your bootVolume OCID
```

TODO .............

## Introduction	##

To get going you need to do some setup tasks.

1. Install Terraform on your machine
2. Install some form of bash on your machine
3. Pull the example files from Git to your selected Terraform working directory
4. Verify your Credentials for an instance in the Oracle Cloud
5. Create or download the public/private keys required
6. Add the configuration details for your instance to Terraforms environment script
7. Test a simple Terraform script to verify your installation
8. BEFORE you can test it you need to create a Boot Volume!!! TODO

## Installation and setup for Windows	##

## 1. Install Terraform on your machine ##
Download Terraform from https://www.terraform.io/downloads.html.
Terraform is distributed in binary form for all platforms. Extract the binary from the archive to a directory that is in your environment *Path* or add a new directory to the Path where you put the Terraform executable.
Since the *Oracle OCI provider* Terraform plugin is now officially released it will auto install itself when you reference the provider in your configuration files. (This happens during the **terraform init** command)

## 2. Install some form of bash on your machine ##
**If you choose to download the pre-created keys then you can skip this step.**

We need to run some OpenSSL commands to create the keys used for authentication. OpenSSL can be installed in most Linux's via the package manager and used from the shell. The easiest way in Win 10 is probably to install the Ubuntu bash or similar from the Windows App Store.
Another possibility is to install the Git-bash https://gitforwindows.org but it is really slow.


## 3. Pull the repo from Git to your selected Terraform working directory ##
Create a working directory for the examples files and do a git pull or download the files. In each of the examples subdirectories a separate Terraform configuration will be created.

## 4. Verify your Credentials for an instance in the Oracle Cloud ##
Make sure you have credentials to login to an Oracle OCI instance. You can always create a Cloud Trial account at http://cloud.oracle.com

## 5. Create the public/private keys required to access the Oracle Cloud ##
Create the public/private keys via your preferred tool as per below.

**Or as an alternative, a set of pre-created keys are available in the example both for ssh use and API access**

The location of the keys should be under the subdirectory ".oci-api-keys" in your home directory, something like: C:\Users\USERNAME\.oci-api-keys
Replace USERNAME with your Windows username. If you downloaded the pre-created keys they should also be in this directory.
You can actually place the keys anywhere as long as you update your env script to reflect the location where you put the files.

Additional instructions on managing keys can be found [here](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/apisigningkey.htm#How).

Go down into the *.oci-api-keys* subdirectory
```
cd .oci-api-keys
```

To generate the private key.
```
openssl genrsa -out oci_api_key.pem 2048
```

To generate the public key
```
openssl rsa -pubout -in oci_api_key.pem -out oci_api_key_public.pem
```

Now you need to add the public key to your cloud instance. The private key will be added to your Terraform env setup script in the next few steps.

Login to Oracle OCI Cloud.
Go to Menu/Identity/Users and select your user.
On your users information page click "Add Public Key"
Add the contents of the public key file you just created "oci_api_key_public.pem".

If you need more help with the steps above [more details can be found here](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/apisigningkey.htm#How2).

## 6. Add the configuration details for your cloud instance to the Terraform environment script ##
TODO In the Terraform samples archive there is an environment file for Windows Powershell "env-vars.ps1".
The following variables (OCID's etc) in this file needs to be updated to reflect your instance details.
```
### Substitute USERNAME to correct the path
### Substitute PASSWORD to the one you set on your private key
### Substitute the OCIDs, fingerprints and keys with the correct ones for your environment
### Authentication details
$env:TF_VAR_tenancy_ocid="ocid1.tenancy.oc1..aaaaaaaazabhxa2ah2t3kwOx6azvo2tl7myjxzq2jdxjf2tabn6mndnrh5lq"
$env:TF_VAR_user_ocid="ocid1.user.oc1..aaaaaaaaehgxm9ccb4locxlxfdfsb4ukslipabcgvoy2gmbencb53axtd3hq"
$env:TF_VAR_fingerprint="04:5d:ce:54:64:4b:28:23:c4:e5:2d:f8:46:86:3f:49"
$env:TF_VAR_private_key_path="C:\Users\USERNAME\.oci\oci_api_key.pem"
$env:TF_VAR_private_key_password="PASSWORD"

### Compartment
$env:TF_VAR_compartment_ocid="ocid1.compartment.oc1..aaaaaaaaicsaq45yn5l6idotcgzhpiwy6ljv4p6koswheo4h5wmguly3tbia"

### Region
$env:TF_VAR_region="us-ashburn-1"

```
Execute the script to set the environment.
```
.\env-vars.ps1
```


## 7. Test a simple Terraform script to verify your installation ##

Finally you need to create a Terraform config file to instruct Terraform to perform some action.
So create the file vcn.tf in your working directory with a simple instruction to create a virtual network.
### Please note, do not have any other .tf files in the same directory ###
```
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "private_key_password" {}
variable "compartment_ocid" {}
variable "region" {}

provider "oci" {
  tenancy_ocid     = "${var.tenancy_ocid}"
  user_ocid        = "${var.user_ocid}"
  fingerprint      = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  private_key_password = "${var.private_key_password}"
  region           = "${var.region}"
}

resource "oci_core_virtual_network" "vcn1" {
  cidr_block     = "10.0.0.0/16"
  dns_label      = "vcn1"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "My Network"
}
```

Now you should be able to test your Terraform installation by running
```
terraform init
```

To validate your Terraform script but not actually run it
```
terraform plan
```

And finally to run your Terraform script do
```
terraform apply
```

To clean up and remove the things you created with "terraform apply"
```
terraform destroy
```

If the above works you can continue and explore the other scripts in the samples you have downloaded.
