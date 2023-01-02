output "default_ingress" {
    value = digitalocean_app.site_app.default_ingress
    description = "Default ingress URL for site"
    depends_on = [digitalocean_app.site_app]
}
