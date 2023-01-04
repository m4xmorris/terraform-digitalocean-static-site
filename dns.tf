module "site_dns" {
    source  = "m4xmorris/dns-record/cloudflare"
    version = "1.1.0"
    count = var.manage_dns ? 1 : 0
    for_each = [
        var.domain,
        "www.${var.domain}"
    ]
    cloudflare_zone_id = var.cloudflare_zone_id
    name = each.value
    type = "CNAME"
    value = replace(digitalocean_app.site_app.default_ingress,"/(https://)|(/)/","")
}