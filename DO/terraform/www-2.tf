resource "digitalocean_droplet" "www-2" {
  # digitalocean: A snapshot was created: 'packer-1556378636' (ID: 46457057) in regions 'nyc1'
  image              = "Add-your-packer-image-ID-number-only-here"
  name               = "www-2"
  region             = "nyc1"
  size               = "512mb"
  private_networking = true

  ssh_keys = [
    "${var.ssh_fingerprint}",
  ]

  connection {
    user = "root"
    type = "ssh"

    #key_file = "${var.pvt_key}"
    private_key = "${file(var.pvt_key)}"
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
    ]
  }
}
