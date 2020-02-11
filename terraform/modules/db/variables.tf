variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "europe-west1-b"
}

variable machine_type {
  description = "Type machine instance"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable public_key_path {
  description = "Path to the public key used for sshaccess"
}
