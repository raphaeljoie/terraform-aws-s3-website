variable "bucket_name" {
  type = string
  default = null
}

variable "fqdn" {
  type = string
}

variable "ssl_domain_name" {
  type = string
}

variable "index_document" {
  type = string
  default = "index.html"
}

variable "error_document" {
  type = string
  default = "404.html"
}

locals {
  bucket_name = var.bucket_name == null ? var.fqdn : var.bucket_name
}
