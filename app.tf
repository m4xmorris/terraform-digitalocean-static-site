resource "digitalocean_app" "site_app" {
  spec {
    name   = "${var.site_name}-app"
    region = var.region
    domain {name = var.domain}

    alert {rule = "DEPLOYMENT_FAILED"}
    alert {rule = "DEPLOYMENT_LIVE"}
    alert {rule = "DOMAIN_FAILED"}
    alert {rule = "DOMAIN_LIVE"}

    static_site {
      name          = var.site_name
      source_dir    = var.source_dir
      output_dir = var.output_dir
      build_command = var.build_command

      github {
        repo = var.source_repo
        branch = var.source_branch
        deploy_on_push = true
      }
      routes {
        path = "/"
      }
    }
    static_site {
      name          = "${var.site_name}-preview"
      source_dir    = var.source_dir
      output_dir = var.output_dir
      build_command = var.build_command

      github {
        repo = var.source_repo
        branch = var.preview_source_branch
        deploy_on_push = true
      }
      routes {
        path = "/preview"
      }
    }
  }
}
