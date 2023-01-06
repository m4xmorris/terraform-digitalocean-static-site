variable "site_name" {
    type = string
    description = "Name of site"
    validation {
        condition = can(regex("^[a-zA-Z0-9-]{1,}$", var.site_name))
        error_message = "Invalid site name. Must only contain alphanumeric and \"-\""
    }
}

variable "region" {
    type = string
    description = "Region to deploy to - https://shorturl.at/htvyK"
}

variable "description" {
    type = string
    description = "Description of site (Shown in DO portal)"
}

variable "environment" {
    type = string
    description = " One of Production/Development/Staging (Shown in DO portal)"
}

variable "domain" {
    type = string
    description = "FQDN to setup for the site"
    validation {
        condition = can(regex("^([a-z0-9]+(-[a-z0-9]+)*\\.)+[a-z]{2,}$", var.domain))
        error_message = "Invalid domain name."
    }
}

variable "source_repo" {
    type = string
    description = "GitHub repo containing site source (example-user/example-repo)"
}

variable "source_branches" {
    type = map(string)
    description = "Map of URLs to deploy to and branches to deploy from (e.g. 'main' = '/')"
    default = {
      "main" = "/"
    }
}

variable "source_dir" {
    type = string
    description = "Directory within repo containg site source"
}

variable "output_dir" {
    type = string
    description = "Directory where site files can be found post-build"
}

variable "build_command" {
    type = string
    description = "Command to build site from source"
}

variable "external_project" {
    type = string
    description = "Set to the ID of an existing DigitalOcean project the site should be attached to (else one will be created)."
    default = "null"
  
}

variable "manage_dns" {
    type = bool
    description = "Should this module manage DNS via Cloudflare (true/false)"
    default = false
}

variable "cloudflare_zone_id" {
    type = string
    description = "Zone ID of the Cloudflare domain to setup"
    default = "null"
}
