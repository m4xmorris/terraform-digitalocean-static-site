resource "digitalocean_project" "site_project" {
  name        = "${var.site_name}-project"
  description = var.description
  purpose     = "Web Application"
  environment = var.environment
  resources = [digitalocean_app.site_app.urn]
  is_default = false
}
