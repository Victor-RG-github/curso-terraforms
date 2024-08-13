variable "stockholm_cidr" {
  description = "Stockholm CIDR"
  type        = string
  sensitive   = false
}

# variable "public_subnet" {
#   description = "Public Subnet"
#   type        = string
# }

# variable "private_subnet" {
#   description = "Private Subnet"
#   type        = string
# }


variable "subnets" {
  description = "Lista de subnets"
  type        = list(string)
}
