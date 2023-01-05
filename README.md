# terraform-digitalocean-static-site

[Terraform](https://www.terraform.io) module for deploying static sites on [DigitalOcean's App Platform](https://www.digitalocean.com/products/app-platform), with support for [Cloudflare](https://cloudflare.com) DNS.

### [Dependencies](https://registry.terraform.io/modules/m4xmorris/static-site/digitalocean/latest?tab=dependencies)

## Usage:
Create a `.tf` file inside your root module to call this module and set variables.
An example workspace can be found in this repo [build test](.github/workflows/terraform-build-test.tf).

See [variables.tf](variables.tf) for variable descriptions and examples.

The site's default ingress URL can be found in the module output `default_ingress`.

Optionally, this module is able to automatically create Cloudflare DNS records pointing to your app. 

To enable this, set the following variables in your `module` block.
* `manage_dns = true`
* `cloudflare_zone_id = "zone_id"`

**Note - If you disable DNS management, you will still need to declare the `cloudflare` provider in your root module to satisfy dependencies.
If you do not wish to provide an API key, you must set it to `nullnullnullnullnullnullnullnullnullnull`.**
