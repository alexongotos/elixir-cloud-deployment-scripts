## Packer json file to build an elixir image on Hetzner hcloud ##

Create an account with Hetzner

Add your ssh key

Create an API key 

(select Access/API tokens)

Test by creating an Ubuntu 16.04 server 

select Add Server

ssh in from your terminal

$ ssh root@<add-server-IP>

test with 

$ packer validate packer-hetzner.json

Create with

$ packer validate packer-hetzner.json

On Hetzner hcloud console watch packer creating temporary server then watch Image being saved under Snapshots