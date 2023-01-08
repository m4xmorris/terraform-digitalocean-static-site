terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

provider "cloudflare" {
  api_token = "nullnullnullnullnullnullnullnullnullnull"
}

provider "digitalocean" {
  token = "null"
}

module "terraform_digitalocean_static_site" {
  source      = "../../."
  site_name   = "build-test"
  region      = "lon"
  description = "Build Test"
  environment = "Development"
  domain      = "example.com"
  source_repo = "example-user/example-repo"
  source_branches = {
    "/"        = "main"
    "/preview" = "dev"
  }
  source_dir         = "source"
  output_dir         = "public"
  build_command      = "bundle exec jekyll build -d ./public"
  manage_dns         = true
  cloudflare_zone_id = "null"
}
