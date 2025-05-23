variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)

  validation {
    condition = alltrue([
        contains(keys(var.tags), "PrimaryOwner"),
        contains(keys(var.tags), "SecondaryOwner"),
    ])
    error_message = join("\n",[
        contains(keys(var.tags), "Primary Owner") ? "" : "tag PrimaryOwner is required",
        contains(keys(var.tags), "Primary Owner") ? "" : "tag SecondaryOwner is required"
    ])
  }
}