
data "template_file" "startup_file" {
  template = file(var.day-0-config)
}