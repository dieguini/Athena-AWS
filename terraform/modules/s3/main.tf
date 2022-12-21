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

# Upload files
/* data "local_file" "files" {
  count    = var.count
  filename = "${var.folder_path}/${count.index}"
}

resource "aws_s3_bucket_object" "object" {
  count  = length(data.local_file.files)
  bucket = aws_s3_bucket.bucket.id
  key    = "${var.folder_path}/${data.local_file.files[count.index].filename}"
  source = data.local_file.files[count.index].filename
} */

resource "aws_s3_object" "files" {
  for_each = fileset(var.folder_path, "**")
  bucket = aws_s3_bucket.bucket.id
  key = "${var.upload_path}/${each.value}"
  source = "${var.folder_path}/${each.value}"
  etag = filemd5("${var.folder_path}/${each.value}")
}