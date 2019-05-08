## Packer json file to build an elixir image on Hetzner hcloud ##



install packer on your laptop 
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

ssh in from your terminal

clone packer-hetzner.json
```
$ ssh root@<add-server-IP>
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