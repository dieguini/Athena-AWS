variable "bucket_name" {
  type        = string
  description = "Bucket name for creation"
}
variable "bucket_folders" {
  type        = list(string)
  description = "List of folder structure for bucket"
  default     = []
}
variable "folder_path" {
  type        = string
  description = "Path of folder to upload"
}
variable "upload_path" {
  type        = string
  description = "Path where the files will be upload (Default root)"
  default = "" # Default root
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
