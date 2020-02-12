provider "google" {
  # Версия провайдера
  version = "2.15.0"
  # ID проекта
  project = var.project
  region  = var.region
}

module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  zone            = var.zone
  app_disk_image  = var.app_disk_image
  machine_type    = var.machine_type
  tags            = var.tags
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  zone            = var.zone
  db_disk_image   = var.db_disk_image
  machine_type    = var.machine_type
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["92.255.99.208/32"]
}
