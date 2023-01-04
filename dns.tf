module "root_dns" {
    count = var.manage_dns ? 1 : 0
    source  = "m4xmorris/dns-record/cloudflare"
    version = "1.1.0"
    cloudflare_zone_id = var.cloudflare_zone_id
    name = var.domain
    type = "CNAME"
    value = replace(digitalocean_app.site_app.default_ingress,"/(https://)|(/)/","")
}

module "www_dns" {
    count = var.manage_dns ? 1 : 0
    source  = "m4xmorris/dns-record/cloudflare"
    version = "1.1.0"
    cloudflare_zone_id = var.cloudflare_zone_id
    name = "www.${var.domain}"
    type = "CNAME"
    value = replace(digitalocean_app.site_app.default_ingress,"/(https://)|(/)/","")
}