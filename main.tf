variable "project_id" {
  type = string
}

variable "ss_password" {
  type = string
}

provider "google" {
  project = var.project_id
  region  = "asia-east2"
  zone    = "asia-east2-a"
}

resource "google_compute_instance" "ssserver" {
  name         = "ss-server"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }

  metadata_startup_script = templatefile("${path.module}/init.tftpl", { password = var.ss_password })
}

resource "google_compute_firewall" "default" {
  name    = "shadowsocks-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443", "80"]
  }

  source_tags = ["web"]
}

resource "google_compute_address" "static_ip" {
  name = "ss-static-ip"
}

output "ss_server_ip" {
  value = google_compute_address.static_ip.address
}

output "ss_server_port" {
  value = 443
}

output "ss_encrypt_method" {
  value = "aes-256-cfb"
}
