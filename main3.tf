resource "local_file" games{
  filename = var.filename
  sensitive_content = var.content
  file_permission=”0755”
}
