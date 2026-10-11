variable "biglake_hive_table_iam_bindings" {
  description = <<EOT
Map of biglake_hive_table_iam_bindings, attributes below
Required:
    - catalog
    - database
    - members
    - name
    - role
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    catalog  = string
    database = string
    members  = set(string)
    name     = string
    role     = string
    project  = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

