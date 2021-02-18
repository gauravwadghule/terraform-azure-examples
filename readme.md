modules folder contains terraform block of code to create and configure building block of infrastructure
Ex. storage accounts and CDN profiles, azure kubernetes services.

warehouse - is the actual terraform code/ configuration that particular warehouse in the region.

terraform state file is maintained according to each region and this terraform state configuration is in setting.tf file. Change to this file according to your backend configuration.

for each resource we have maintained separate terraform file to avoid confusion and complexity.

for each warehouse you have to create terrafom.tfvars file to define variables required in this module. All input variables are defined in the varibles.tf and all output varibles are defined in the output.tf