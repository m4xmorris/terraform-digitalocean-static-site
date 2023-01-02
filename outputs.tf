output "default_ingress" {
    value = digitalocean_app.site_app.default_ingress
    depends_on = [digitalocean_app.site_app]
}