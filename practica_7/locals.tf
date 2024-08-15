locals {
  sufix    = "${var.tags.project}-${var.tags.region}-${var.tags.env}"
  s3-sufix = random_string.s3-sufix.id
}

resource "random_string" "s3-sufix" {
  length  = 8
  special = false
  upper   = false
}
