variable zone {
  description = "Zone"
  default     = "europe-west1"
}

variable app_disk_image {
  description = "Disk image fo reddit app"
  default     = "reddit-app-base"
}

variable public_key_path {
  description = "Path to the public key used for ssh acces"
}

variable machine_type {
  description = "Type michine instance"
  default     = "g1-small"
}

variable tags {
  description = "Network tags"
}
