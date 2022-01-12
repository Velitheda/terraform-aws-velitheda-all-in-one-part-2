provider "aws" {
  region = var.region
}

module "fetching" {
  source = "./modules/fetching"
}

module "networking" {
  source = "./modules/networking"

  availability-zone = var.availability-zone
}

resource "aws_instance" "web_server_02_jasmine" {
  ami           = module.fetching.ami
  instance_type = "t2.micro"
  subnet_id     = module.networking.aws_subnet_id

  tags = {
    Name = "web-server-02-jasmine"
  }
}

