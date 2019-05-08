##Packer json file to build an elixir image on Hetzner hcloud##
##Test ssh access from your laptop to Hetzner cloud##

Install packer on your laptop 
https://www.packer.io/intro/getting-started/install.html

For OSX
```
$ brew install packer
```
Create an account with Hetzner.

Add your ssh key.

Create an API key. 

Select Access/API tokens.

Test by creating an Ubuntu 16.04 server. 

Select Add Server.

Test ssh access to Hetzner from your laptop.

```
$ ssh root@<add-server-IP>
```
Destroy test server.

##Run packer on your laptop##
```
git clone https://github.com/elay12/elixir-cloud-deployment-scripts.git down to your laptop

cd elixir-cloud-deployment-scripts/Hetzner/packer/
```
Edit packer-hetzner.json and add your Hetzner API key to this line
```
"token": "add-your-Hetzner-API-key",

```
test with 
```
$ packer validate packer-hetzner.json
```
Create with
```
$ packer validate packer-hetzner.json
```
On Hetzner hcloud console watch packer creating temporary server then watch Image being saved under Snapshots