# Bucket
variable "bucket_vars" {
  description = "Map of variables use for bucket"
  type        = map(string)
}
variable "bucket_folders" {
  type        = list(string)
  description = "List of folder structure for bucket"
  default     = []
}
variable "context_vars" {
  description = "Map of variables use for bucket"
  type        = map(string)
}
# Tagging system
variable "resource_specific_tags" {
  description = "Map of tags to assign to specific resources supporting tags. Merged with `tags`."
  type        = map(map(string))

  default = {}
}
variable "tags" {
  description = "Map of general tags to assign to all resources supporting tags"
  type        = map(string)

  default = {}
}
