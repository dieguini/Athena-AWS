resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  tags = merge(
    var.tags,
    lookup(var.resource_specific_tags, "s3_bucket", {})
  )
}

# ACL Rule
resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

# Folder and Files
resource "aws_s3_object" "test" {
  for_each = fileset(var.bucket_folder, "**/*")

  bucket = aws_s3_bucket.bucket.id
  key    = each.value
  source = "${var.bucket_folder}/${each.value}"
  etag   = filemd5("${var.bucket_folder}/${each.value}")
}