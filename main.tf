resource "google_biglake_hive_table_iam_binding" "biglake_hive_table_iam_bindings" {
  for_each = var.biglake_hive_table_iam_bindings

  catalog  = each.value.catalog
  database = each.value.database
  members  = each.value.members
  name     = each.value.name
  role     = each.value.role
  project  = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

