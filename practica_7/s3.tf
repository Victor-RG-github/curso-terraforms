resource "aws_s3_bucket" "cerberus_bucket" {
  bucket = "s3-bucket-${local.s3-sufix}"
}
