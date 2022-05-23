
# Remote Backend configuration
  terraform {
  backend "s3" {
    encrypt        = false
    bucket         = "backend-terraform-state-file-storage"
    key            = "terraformfirst.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking-dynamo"


  }
}

