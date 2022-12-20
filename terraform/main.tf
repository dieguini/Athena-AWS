terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }

  required_version = ">= 1.3.0"
}

################################################################################
# Calling Modules
################################################################################
# Bucket
module "bucket" {
  source      = "./modules/s3"
  bucket_name = var.bucket_vars.name
  tags        = var.tags
}
