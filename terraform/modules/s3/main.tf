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

# Folder Structure
resource "aws_s3_object" "folder_structure" {
  count = length(var.bucket_folders)

  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
  key    = var.bucket_folders[count.index]
  source = "/dev/null"
}