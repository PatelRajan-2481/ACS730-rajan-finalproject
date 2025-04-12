provider "aws" {
  region = "us-east-1"
}

module "networking" {
  source = "../../modules/networking"

  name_prefix          = "Rajan-Stag"
  vpc_cidr             = "10.1.0.0/16"
  public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24", "10.1.4.0/24"]
  private_subnet_cidrs = ["10.1.5.0/24", "10.1.6.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
}

module "security" {
  source           = "../../modules/security"
  name_prefix      = "Rajan-Stag"
  vpc_id           = module.networking.vpc_id
  allowed_ssh_cidr = "0.0.0.0/0"
}


module "ec2" {
  source = "../../modules/ec2"

  name_prefix       = "Rajan-Stag"
  ami_id            = "ami-0c02fb55956c7d316"
  instance_type     = "t2.micro"
  subnet_ids        = module.networking.public_subnet_ids
  webserver_names   = ["Webserver1", "Bastion", "Webserver3"]
  key_name          = "rajan-key"
  security_group_id = module.security.security_group_id
}

module "webserver4" {
  source            = "../../modules/ec2"
  name_prefix       = "Rajan-Stag"
  ami_id            = "ami-0c02fb55956c7d316"
  instance_type     = "t2.micro"
  subnet_ids        = [module.networking.public_subnet_ids[3]] # Subnet 4
  webserver_names   = ["Webserver4"]
  key_name          = "rajan-key"
  security_group_id = module.security.security_group_id
}


module "database" {
  source            = "../../modules/ec2"
  name_prefix       = "Rajan-Stag"
  ami_id            = "ami-0c02fb55956c7d316"
  instance_type     = "t2.micro"
  subnet_ids        = [module.networking.private_subnet_ids[0]]
  webserver_names   = ["DatabaseServer"]
  key_name          = "rajan-key"
  security_group_id = module.security.private_security_group_id
}
module "vm6" {
  source            = "../../modules/ec2"
  name_prefix       = "Rajan-Stag"
  ami_id            = "ami-0c02fb55956c7d316"
  instance_type     = "t2.micro"
  subnet_ids        = [module.networking.private_subnet_ids[1]]
  webserver_names   = ["VM6"]
  key_name          = "rajan-key"
  security_group_id = module.security.private_security_group_id
}

#Test 
