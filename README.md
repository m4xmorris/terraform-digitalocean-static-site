# do-apps-tf

[Terraform](https://www.terraform.io) module for deploying static sites on [DigitalOcean's App Platform](https://www.digitalocean.com/products/app-platform), with integration to [Cloudflare](https://cloudflare.com) DNS.

## Usage:
Create a `.tf` file inside your root module to call the module and setup variables:
```
module "do_apps_tf" {
	source = "github.com/maxmorrisio/do-apps-tf.git?ref=v1.0.0" # <-- Change this to the desired version
	site_name = "name-of-site"
	description = "Description of site"
	environment = "x" # Must be Production/Development
	region = "lon" # https://docs.digitalocean.com/products/app-platform/details/availability/
	domain = "example.com"
	source_repo = "github-user/github-repo"
	source_branch = "main"
	preview_source_branch = "dev"
	source_dir = "hugo" # Directory within your repo that contains site source
	output_dir = "public" # Directory your source is built to
	build_command = "hugo -d public"
	cloudflare_zone_id = "cloudflare_domain_zone_id"
	cloudflare_token = "cloudflare_api_key"
	do_token = "digitalocean_api_key"
}

```
**Note - Your Cloudflare access token must provide edit permissions for the zone's DNS AND Page Rules.**
