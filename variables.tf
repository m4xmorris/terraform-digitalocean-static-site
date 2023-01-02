variable "do_token" {
    description = "DigitalOcean API Token"
    sensitive = true
}
variable "cloudflare_token" {
    description = "Cloudflare API Token"
    sensitive = true
}
variable "site_name" {description = "Name of site"}
variable "region" {description = "Region to deploy to - https://shorturl.at/htvyK"}
variable "description" {description = "Description of site (Shown in DO portal)"}
variable "environment" {description = " One of Production/Development/Staging (Shown in DO portal)"}
variable "domain" {description = "FQDN to setup for the site"}
variable "cloudflare_zone_id" {description = "Zone ID of the Cloudflare domain to setup"}
variable "source_repo" {description = "GitHub repo containing site source (example-user/example-repo)"}
variable "source_branch" {description = "Branch of repo to use"}
variable "source_dir" {description = "Directory within repo containg site source"}
variable "output_dir" {description = "Directory where site files can be found post-build"}
variable "build_command" {description = "Command to build site from source"}
variable "preview_source_branch" {description = "Branch of repo to use for development preview"}