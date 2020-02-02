variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1"
}

variable zone {
  description = "Zone"
 #Значение по умолчанию
 default = "europe-west1-b"
}

variable inst_list {
# Тип список имен инстансов
type =list (string)
}

variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable privat_key_path {
  description = "Privat Key SSH"
}
