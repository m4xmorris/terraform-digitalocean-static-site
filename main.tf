resource "digitalocean_project" "site_project" {
  count       = var.external_project == "null" ? 1 : 0
  name        = "${var.site_name}-project"
  description = var.description
  purpose     = "Web Application"
  environment = var.environment
  resources   = [digitalocean_app.site_app.urn]
  is_default  = false
}

resource "digitalocean_project_resources" "external_project" {
  count     = var.external_project == "null" ? 0 : 1
  project   = var.external_project
  resources = [digitalocean_app.site_app.urn]
}

resource "digitalocean_app" "site_app" {
  spec {
    name   = "${var.site_name}-app"
    region = var.region
    domain { name = var.domain }

    dynamic "alert" {
      for_each = var.alert_policy
      content {
        rule = alert.value
      }
    }

    dynamic "static_site" {
      for_each = var.source_branches
      content {
        name          = "${var.site_name}-${static_site.key}"
        source_dir    = var.source_dir
        output_dir    = var.output_dir
        build_command = var.build_command
        github {
          repo           = var.source_repo
          branch         = static_site.key
          deploy_on_push = true
        }
        routes {
          path = static_site.value
        }
      }
    }
    dynamic "env" {
      for_each = { for k, v in var.env_variables : k => v }
      content {
        key   = env.key
        value = env.value
        scope = "RUN_AND_BUILD_TIME"
        type  = "GENERAL"
      }
    }
  }
}

resource "cloudflare_record" "root_record" {
  count      = var.manage_dns ? 1 : 0
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = replace(digitalocean_app.site_app.default_ingress, "/(https://)|(/)/", "")
  type       = "CNAME"
  depends_on = [digitalocean_app.site_app]
}

resource "cloudflare_record" "www_record" {
  count      = var.manage_dns ? 1 : 0
  zone_id    = var.cloudflare_zone_id
  name       = "www.${var.domain}"
  value      = replace(digitalocean_app.site_app.default_ingress, "/(https://)|(/)/", "")
  type       = "CNAME"
  depends_on = [digitalocean_app.site_app]
}


