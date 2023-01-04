# terraform-digitalocean-static-site

[Terraform](https://www.terraform.io) module for deploying static sites on [DigitalOcean's App Platform](https://www.digitalocean.com/products/app-platform), with support for [Cloudflare](https://cloudflare.com) DNS.

## Usage:
Create a `.tf` file inside your root module to call the module and set variables:
```
module "static_site" {
	source  = "m4xmorris/static-site/digitalocean"
	version = "" # <-- It is recommended to lock at known working versions. Remove this for latest release.
	site_name = ""
	description = ""
	environment = ""
	region = ""
	domain = ""
	source_repo = ""
	source_branch = ""
	preview_source_branch = ""
	source_dir = ""
	output_dir = ""
	build_command = ""
	do_token = ""
}

```
See [variables.tf](variables.tf) for variable descriptions and examples.

The app's default ingress URL can be found in the TF output `module.static_site.default_ingress`.

Optionally, this module is able to automatically create Cloudflare DNS records pointing to your app. 

To enable this, set the following variables in your `module` block.
* manage_dns
* cloudflare_zone_id
* cloudflare_token (**Note - Your Cloudflare access token must provide edit permissions for the zone's DNS AND Page Rules.**)
