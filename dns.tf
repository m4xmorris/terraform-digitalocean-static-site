resource "cloudflare_record" "root_record" {
  count = var.manage_dns ? 1 : 0
  zone_id = var.cloudflare_zone_id
  name    = var.domain
  value   = replace(digitalocean_app.site_app.default_ingress,"/(https://)|(/)/","")
  type    = "CNAME"
  depends_on = [digitalocean_app.site_app]
}

resource "cloudflare_record" "www_record" {
  count = var.manage_dns ? 1 : 0
  zone_id = var.cloudflare_zone_id
  name    = "www.${var.domain}"
  value   = replace(digitalocean_app.site_app.default_ingress,"/(https://)|(/)/","")
  type    = "CNAME"
  depends_on = [digitalocean_app.site_app]
}