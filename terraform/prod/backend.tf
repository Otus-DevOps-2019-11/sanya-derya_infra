terraform {
  backend "gcs" {
    bucket = "ex1-ex2---storage-bucket-test"
    prefix = "terraform/prod"
  }
}
