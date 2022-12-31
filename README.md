# do-apps-tf

[Terraform](https://www.terraform.io) module for deploying static sites on [DigitalOcean's App Platform](https://www.digitalocean.com/products/app-platform), with integration to [Cloudflare](https://cloudflare.com) DNS.

## Usage:
1. Add this repo as a submodule to your existing IaC/Terraform repo (`git submodule add https://github.com/maxmorrisio/do-apps-tf.git`).
2. Create a `.tf` file inside your root module to call the module and setup variables:
```
module "do_apps_tf" {
	source = "./do-apps-tf"
	site_name = "name-of-site"
	description = "Description of site"
	environment = "x" # Must be Production/Development
	region = "lon" # https://docs.digitalocean.com/products/app-platform/details/availability/
	domain = "example.com"
	source_repo = "github-user/github-repo"
	source_branch = "main"
	source_dir = "hugo" # Directory within your repo that contains site source
	output_dir = "public" # Directory your source is built to
	build_command = "hugo -d public"
	cloudflare_zone_id = "${var.cloudflare_zone_id}"
	cloudflare_token = "${var.cloudflare_token}"
	do_token = "${var.do_token}"
}

```
**Note - Your Cloudflare access token must provide edit permissions for the zone's DNS AND Page Rules.**

Example: [maxmorrisio/personal-site/terraform/dev](https://github.com/maxmorrisio/personal-site/tree/main/terraform/dev)
