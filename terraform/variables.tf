# Bucket
variable "bucket_vars" {
  description = "Map of variables use for bucket"
  type        = map(string)
}
variable "context_vars" {
  description = "Map of variables use for bucket"
  type        = map(string)
}
# Database - Glue
variable "database_glue_vars" {
  description = "Map of variables use for bucket"
  type        = map(string)
}
/* variable "tables" {
  description = "Tables to use on Glue"
  type        = list(string)
  default     = []
} */
variable "tables" {
  type = list(object({
    name     = string
    location = string
    storage_descriptor = object({
      input_format          = string
      output_format         = string
      serialization_library = string
    })
    columns = list(object({
      name = string
      type = string
    }))
  }))
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
