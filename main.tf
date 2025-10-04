terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.50.0"
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

variable "project_id" {
  description = "The GCP project ID where resources will be created"
  type        = string
}

variable "region" {
  description = "The GCP region to deploy resources into"
  type        = string
}
