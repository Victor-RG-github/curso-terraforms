stockholm_cidr = "10.10.0.0/16"
# public_subnet  = "10.10.0.0/24"
# private_subnet = "10.10.1.0/24"

subnets = ["10.10.0.0/24", "10.10.1.0/24"]


tags = {
  "env"         = "dev"
  "Owner"       = "vrodriguez"
  "cloud"       = "aws"
  "IAC"         = "terraform"
  "IAC_version" = "1.3.10"
}
