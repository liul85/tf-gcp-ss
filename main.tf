provider "google" {
  project = "fgfw-236501"
  region  = "asia-east2"
  zone    = "asia-east2-a"
}

resource "google_compute_instance" "ssserver" {
  name         = "ss-server"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params = {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config = {
      nat_ip = "${google_compute_address.static_ip.address}"
    }
  }

  metadata_startup_script = "sudo apt-get update; sudo apt install -y shadowsocks-libev;"
}

resource "google_compute_firewall" "default" {
  name    = "ss-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443", "80"]
  }
}

resource "google_compute_address" "static_ip" {
  name = "ss-static-ip"
}
