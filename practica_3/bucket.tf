locals {
  common_tags = {
    ci          = "ercs"
    Departament = "salut"
    Env         = "dev"
    Programa    = "ercs"
  }
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${local.common_tags.Env}-${local.common_tags.Departament}-${local.common_tags.ci}-${random_string.sufix.id}"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
  tags = {
    environment = "dev",
    identifer   = "prueba_victor"
  }
}

resource "random_string" "sufix" {
  length  = 4
  special = false
  upper   = false
  numeric = false
}

