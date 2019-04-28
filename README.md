# elixir-cloud-deployment-scripts
Terraform and packer scripts for building elixir environments on Digitaloceon, Hetzner and AWS

These are Terraform and Packer files for building elixir environments on Digtaloceon. Packer is used to build an elixir base image that can be used as a custom image stored on Digitaloceon to build immutable environments with terraform.

The following Digitaloceon How-To's were used as guides. digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean#describe-haproxy-server digitalocean.com/community/tutorials/how-to-create-digitalocean-snapshots-using-packer-on-ubuntu-16-04

These scripts fix some gotcha's in the How-To's

Steps On MacOS and Linux setup laptop Read instructions in Digitaloceon terraform HOWTO's above to setup your environment variables on your laptop,(Sections 1,2 and 3),then follow these steps.

Create a digital Oceon account - digitalocean.com - (See prequisites in link above for details in this section).

Open a terminal window or tab to setup your local environment.

Setup ssh connection to DigitalOceon.

Export your DigitalOcean API Token (DO_PAT) export DO_PAT=ADD_YOUR_DIGITALOCEON_API_TOKEN_HERE echo $DO_PAT
