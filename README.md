# do-apps-tf

Bundle for deploying static sites on [DigitalOcean's App Platform](https://www.digitalocean.com/products/app-platform) using [Terraform](https://www.terraform.io)

## Usage:
1. Edit [variables.tfvars](https://github.com/m4xwellmorris/do-apps-terraform/edit/main/variables.tfvars) to reflect your site.
2. Run:
```
terraform apply -var-file=variables.tfvars -var="do_token"="DO_TOKEN_HERE" -var="cloudflare_token"="CLOUDFLARE_TOKEN_HERE"
```


**Note - Your Cloudflare access token must provide edit permissions for the zone's DNS AND Page Rules.**
