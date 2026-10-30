terraform {
  required_version = ">= 1.10"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket       = "tobi-day85-829999272172-tfstate"
    key          = "week22/pipeline-demo/terraform.tfstate"
    region       = "eu-central-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "demo" {
  bucket = "tobi-day85-829999272172-pipeline-demo"
  tags = {
    ManagedBy   = "terraform-pipeline"
    Day         = "89"
    Environment = "dev"
  }
}
resource "aws_s3_bucket_versioning" "demo" {
  bucket = aws_s3_bucket.demo.id
  versioning_configuration {
    status = "Enabled"
  }
}
# test OIDC secure policy
# fix trust remove job_workflow_ref
# final OIDC fix
# trigger run 9 after bypass gate fix
