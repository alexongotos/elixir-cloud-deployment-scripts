These are Terraform and Packer files for building elixir environments on Digitaloceon.
Packer is used to build an elixir base image that can be used as a custom image stored on Digitaloceon to build immutable environments with terraform.

The following Digitaloceon How-To's were used as guides.
https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean#describe-haproxy-server
https://www.digitalocean.com/community/tutorials/how-to-create-digitalocean-snapshots-using-packer-on-ubuntu-16-04

These scripts fix some gotcha's in the How-To's

# Prerequisite Steps
On MacOS and Linux setup laptop
Read instructions in Digitaloceon terraform HOWTO's above to setup your environment variables on your laptop,(Sections 1,2 and 3),then follow these steps.

Create a digital Oceon account - https://www.digitalocean.com/ - (See prequisites in link above for details in this section).

Open a terminal window or tab to setup your local environment.

Setup ssh connection to DigitalOceon.

Export your DigitalOcean API Token (DO_PAT)
    ```
    export DO_PAT=ADD_YOUR_DIGITALOCEON_API_TOKEN_HERE
    echo $DO_PAT
    ```

Export your ssh fingerprint:

$ export ssh_fingerprint=$(ssh-keygen -E md5 -lf ~/.ssh/id_rsa.pub | awk '{print $2}')
$ echo $ssh_fingerprint 
$ echo $HOME


Install terraform and packer using ASDF or use the instructions from the links above.

Check terraform versions.
$ terraform -v
$ packer -v

3. Add Terraform Path to your Profile





# BUILD your elixir image with Packer

Create a separate terminal window or tab to run your packer scripts.

git clone this repo
$ cd $HOME/elixir-cloud-deployment-scripts/DO/packer
Edit packer-elixir-base.json and paste your $DO_PAT string into this line "api_token": "PASTE_YOUR_DIGITALOCEON_API_TOKEN_HERE",

Check the packer file validates

packer validate packer-elixir-base.json

Build the image on Digitaloceon
packer build packer-elixir-base.json

In your Digitaloceon browser window this will create a temporary droplet, install elixir, save the image to the snapshots folder and finally delete the temporary droplet.
On your laptop make a note of the image ID number at the end of the packer build log printed to your terminal screen. shown below in last line in brackets.
This is required by the terraform scripts.

==> digitalocean: Gracefully shutting down droplet...
==> digitalocean: Creating snapshot: packer-1556378636
==> digitalocean: Waiting for snapshot to complete...
==> digitalocean: Destroying droplet...
==> digitalocean: Deleting temporary ssh key...
Build 'digitalocean' finished.

==> Builds finished. The artifacts of successful builds are:
--> digitalocean: A snapshot was created: 'packer-1556378636' (ID: 46457057) in regions 'nyc1'

# Build your environment with terraform

Create a separate terminal window or tab to run your terraform scripts

cd $HOME/elixir-cloud-deployment-scripts/DO/terraform

Terraform init

Check Terraform plan - this prints out your server plan for checking.
terraform plan -var "do_token=${DO_PAT}" -var "pub_key=$HOME/.ssh/id_rsa.pub" -var "pvt_key=$HOME/.ssh/id_rsa" -var "ssh_fingerprint=ADD_YOUR_SSH_FINGERPRINT_HERE"

Apply Terraform plan - this will build your servers on DigitalOceon.
terraform apply -var "do_token=${DO_PAT}" -var "pub_key=$HOME/.ssh/id_rsa.pub" -var "pvt_key=$HOME/.ssh/id_rsa" -var "ssh_fingerprint=ADD_YOUR_SSH_FINGERPRINT_HERE"

View the apply process in your Digitaloceon browser.

Destroy Terraform plan - this will destroy your environment on Digitaloceon.
terraform plan -destroy -out=terraform.tfplan   -var "do_token=${DO_PAT}"   -var "pub_key=$HOME/.ssh/id_rsa.pub"   -var "pvt_key=$HOME/.ssh/id_rsa"   -var "ssh_fingerprint=$ssh_fingerprint"

View the destroy process in your Digitaloceon browser.

You should now have both packer and terraform scripts able to set up a basic 3 node elixir environment with a prebuilt elixir image.