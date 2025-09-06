terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.27.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "example" {
  name     = "my-wif-secured-bucket-${random_id.bucket_suffix.hex}"
  location = var.region
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

variable "project_id" {}
variable "region" {}
