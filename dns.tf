locals {
    dns_records = {
        "www" = "${var.domain}"
        "root" = "www.${var.domain}"
    }
}

module "site_dns" {
    source  = "m4xmorris/dns-record/cloudflare"
    version = "1.1.0"
    for_each = {
        for k, v in locals.dns_records : k => v
        if var.manage_dns
    }
    cloudflare_zone_id = var.cloudflare_zone_id
    name = each.value
    type = "CNAME"
    value = replace(digitalocean_app.site_app.default_ingress,"/(https://)|(/)/","")
}