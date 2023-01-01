resource "cloudflare_page_rule" "delete_www" {
  zone_id = var.cloudflare_zone_id
  target = "www.${var.domain}/*"
  actions {
    forwarding_url {
      url = "https://${var.domain}/$1"
      status_code = "301"
    }
  }
}
