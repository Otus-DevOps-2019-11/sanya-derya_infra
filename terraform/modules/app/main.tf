resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    initialize_params { image = var.app_disk_image }
  }
  metadata = { ssh-keys = "appuser:${file(var.public_key_path)}" }
  tags     = [var.tags]
  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"
    # использовать ephemeral IP для доступа из Интернет
    access_config { nat_ip = google_compute_address.app_ip.address }
  }
}

resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}
