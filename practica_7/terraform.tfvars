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
  "project"     = "cerberus"
  "region"      = "eu-north-1"
}

sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  "ami"           = "ami-02af70169146bbdd3"
  "instance_type" = "t3.micro"
}

deploy_conditional = false

ingress_port_list = [22, 80, 443]
