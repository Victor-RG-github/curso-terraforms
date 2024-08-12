resource "random_string" "sufix" {
  count   = 3
  length  = 4
  special = false
  upper   = false
  numeric = false
}

/*resource "random_string" "sufix-1" {
  length  = 4
  special = false
  upper   = false
  numeric = false
}*/
