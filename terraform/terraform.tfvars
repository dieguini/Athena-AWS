# Bucket
bucket_vars = {
  "name" = "athena-bucket-djauregui"
}
bucket_folders = [
  "sample_json/"
]
# Database - Glue
database_glue_vars = {
  "database_name" = "athena_database_djauregui"
}


context_vars = {
  "aws_region" = "us-east-1"
}
tags = {
  "Bootcamp"    = "value",
  "CreatedWith" = "terraform"
}