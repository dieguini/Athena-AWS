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

  bucket_folder = var.bucket_vars.bucket_folder
}
# Database - Glue
module "glue_database" {
  source        = "./modules/glue"
  database_name = var.database_glue_vars.database_name
  tables        = var.tables

  depends_on = [
    module.bucket
  ]

  # V1
  # Example location: s3://athena-bucket-djauregui/capital_cities/
  # table_location = "s3://${module.bucket.bucket_id}/sample_json/"
}
