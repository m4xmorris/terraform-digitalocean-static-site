output "project_id" {
  value       = var.external_project == null ? digitalocean_project.site_project[0].id : null
  description = "ID of the project."
  depends_on  = [digitalocean_project.site_project]
}

output "project_owner_uuid" {
  value       = var.external_project == null ? digitalocean_project.site_project[0].owner_uuid : null
  description = "UUID of the project owner."
  depends_on  = [digitalocean_project.site_project]
}

output "project_owner_id" {
  value       = var.external_project == null ? digitalocean_project.site_project[0].owner_id : null
  description = "ID of the project owner."
  depends_on  = [digitalocean_project.site_project]

}

output "project_creation" {
  value       = var.external_project == null ? digitalocean_project.site_project[0].created_at : null
  description = "Timestamp of project creation"
  depends_on  = [digitalocean_project.site_project]
}

output "project_updated" {
  value       = var.external_project == null ? digitalocean_project.site_project[0].updated_at : null
  description = "Timestamp of last project modification."
  depends_on  = [digitalocean_project.site_project]
}

output "site_id" {
  value       = digitalocean_app.site_app.id
  description = "ID of the site."
  depends_on  = [digitalocean_app.site_app]
}

output "default_ingress" {
  value       = digitalocean_app.site_app.default_ingress
  description = "Default ingress URL for the site."
  depends_on  = [digitalocean_app.site_app]
}

output "live_url" {
  value       = digitalocean_app.site_app.live_url
  description = "Live URL for the site."
  depends_on  = [digitalocean_app.site_app]
}

output "active_deployment_id" {
  value       = digitalocean_app.site_app.active_deployment_id
  description = "ID of the currently active site deployment."
  depends_on  = [digitalocean_app.site_app]
}

output "urn" {
  value       = digitalocean_app.site_app.urn
  description = "URN of the site app."
  depends_on  = [digitalocean_app.site_app]

}

output "app_updated" {
  value       = digitalocean_app.site_app.updated_at
  description = "Timestamp of last update to site app."
  depends_on  = [digitalocean_app.site_app]
}

output "app_created" {
  value       = digitalocean_app.site_app.created_at
  description = "Timestamp of app creation"
  depends_on  = [digitalocean_app.site_app]
}