resource "digitalocean_project" "site-project" {
  name        = "${var.site_name}-project"
  description = var.description
  purpose     = "Web Application"
  environment = var.environment
  resources = [digitalocean_app.site-app.urn]
  is_default = false
}
