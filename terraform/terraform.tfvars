# Bucket
bucket_vars = {
  "name"          = "athena-bucket-djauregui"
  "bucket_folder" = "./s3_files"
}
# Database - Glue
database_glue_vars = {
  "database_name" = "athena_database_djauregui"
}
# tables = ["sample_json_tb"]
tables = [
  {
    "name"     = "sample_json_tb"
    "location" = "s3://athena-bucket-djauregui/sample_json/"
    "storage_descriptor" = {
      "input_format"          = "org.apache.hadoop.mapred.TextInputFormat"
      "output_format"         = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"
      "serialization_library" = "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe"
    }
    "columns" = [
      {
        "name" = "json_string"
        "type" = "string"
      }
    ]
  }
]

# Other configuration
context_vars = {
  "aws_region" = "us-east-1"
}
tags = {
  "Bootcamp"    = "value",
  "CreatedWith" = "terraform"
}