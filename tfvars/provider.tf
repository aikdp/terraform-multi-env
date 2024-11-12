#Create diff buckets for diff env and also with diff keys
#Dev--> bucket name: nov-remote-state-dev  ; Dynamo_DB_table name: nov-locking-dev
#Prod--> bucket name: nov-remote-state-prod  ; Dynamo_DB_table name: nov-locking-prod


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
   backend "s3" {   #remove buckets here and mention seperately
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}