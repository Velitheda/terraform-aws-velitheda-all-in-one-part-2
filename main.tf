provider "aws" {
  region = var.region
}

module "velitheda-fetching" {
  source = "Velitheda/velitheda-fetching/aws"
}

module "velitheda-networking" {
  source            = "Velitheda/velitheda-networking/aws"
  availability-zone = var.availability-zone
}

resource "aws_instance" "web_server_02_jasmine" {
  ami           = module.velitheda-fetching.ami
  instance_type = "t2.micro"
  subnet_id     = module.velitheda-networking.aws_subnet_id

  tags = {
    Name = "web-server-02-jasmine"
  }
}

