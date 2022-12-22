variable "bucket_name" {
  type        = string
  description = "Bucket name for creation"
}
variable "bucket_folder" {
  type        = string
  description = "Bucket folder to upload"
}
# Taggin system
variable "tags" {
  description = "Map of mass assign tags to all resources"
  type        = map(string)
}
variable "resource_specific_tags" {
  description = "Map of tags to assign to specific resources supporting tags. Merged with `tags`."
  type        = map(map(string))

  default = {}
}
