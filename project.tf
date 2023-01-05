resource "digitalocean_project" "site_project" {
  count = var.external_project == "null" ? 1 : 0
  name        = "${var.site_name}-project"
  description = var.description
  purpose     = "Web Application"
  environment = var.environment
  resources = [digitalocean_app.site_app.urn]
  is_default = false
}

resource "digitalocean_project_resources" "external_project" {
  count = var.external_project == "null" ? 0 : 1
  project = var.external_project
  resources = [digitalocean_app.site_app.urn]
}