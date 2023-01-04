output "project_id" {
    value = digitalocean_project.site_project.id
    description = "ID of the project."
    depends_on = [digitalocean_project.site_project]
}

output "project_owner_uuid" {
    value = digitalocean_project.site_project.owner_uuid
    description = "UUID of the project owner."
    depends_on = [digitalocean_project.site_project]
}

output "project_owner_id" {
    value = digitalocean_project.site_project.owner_id
    description = "ID of the project owner."
    depends_on = [digitalocean_project.site_project]
  
}

output "project_creation" {
    value = digitalocean_project.site_project.created_at
    description = "Timestamp of project creation"
    depends_on = [digitalocean_project.site_project]
}

output "project_updated" {
    value = digitalocean_project.site_project.updated_at
    description = "Timestamp of last project modification."
    depends_on = [digitalocean_project.site_project]
}

output "site_id" {
    value = digitalocean_app.site_app.id
    description = "ID of the site."
    depends_on = [digitalocean_app.site_app]
}

output "default_ingress" {
    value = digitalocean_app.site_app.default_ingress
    description = "Default ingress URL for the site."
    depends_on = [digitalocean_app.site_app]
}

output "live_url" {
    value = digitalocean_app.site_app.live_url
    description = "Live URL for the site."
    depends_on = [digitalocean_app.site_app]
}

output "active_deployment_id" {
    value = digitalocean_app.site_app.active_deployment_id
    description = "ID of the currently active site deployment."
    depends_on = [digitalocean_app.site_app]
}

output "urn" {
    value = digitalocean_app.site_app.urn
    description = "URN of the site app."
    depends_on = [digitalocean_app.site_app]
  
}

output "app_updated" {
    value = digitalocean_app.site_app.updated_at
    description = "Timestamp of last update to site app."
    depends_on = [digitalocean_app.site_app]
}

output "app_created" {
    value = digitalocean_app.site_app.created_at
    description = "Timestamp of app creation"
    depends_on = [digitalocean_app.site_app]
}