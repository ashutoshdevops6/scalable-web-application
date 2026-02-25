# Main Terraform Configuration File

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./vpc"
}

module "ec2" {
  source = "./ec2"
}

module "nlb" {
  source = "./nlb"
}

module "autoscaling" {
  source = "./autoscaling"
}

module "rds" {
  source = "./rds"
}