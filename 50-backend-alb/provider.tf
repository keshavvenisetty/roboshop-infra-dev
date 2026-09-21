terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.63.0"
    }
  }

backend "s3" {          #banckend is nothing but state
    bucket = "84ask-remote-state-dev"
    key    = "roboshop-dev-backend-alb"
    use_lockfile = true  # enable s3 native locking
    encrypt = true
    region = "us-east-1"
  }

}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
