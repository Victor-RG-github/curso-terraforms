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

variable "tags" {
  description = "Variables del proyecto"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "CDIR for ssh ingress traffic"
  type        = string
}
