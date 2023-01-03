variable "do_token" {
    description = "DigitalOcean API Token"
    sensitive = true
}

variable "cloudflare_token" {
    description = "Cloudflare API Token"
    default = "nullnullnullnullnullnullnullnullnullnull"
    sensitive = true
}

variable "site_name" {
    description = "Name of site"
    validation {
        condition = can(regex("^[a-zA-Z0-9-]{1,}$", var.site_name))
        error_message = "Invalid site name. Must only contain alphanumeric and \"-\""
    }
}

variable "region" {
    description = "Region to deploy to - https://shorturl.at/htvyK"
}

variable "description" {
    description = "Description of site (Shown in DO portal)"
}

variable "environment" {
    description = " One of Production/Development/Staging (Shown in DO portal)"
    validation {
        condition = can(regex("^Production$|^Development$|^Staging$", var.environment))
        error_message = "Environment must be one of Production/Development/Staging."
    }  
}

variable "domain" {
    description = "FQDN to setup for the site"
    validation {
        condition = can(regex("^([a-z0-9]+(-[a-z0-9]+)*\\.)+[a-z]{2,}$", var.domain))
        error_message = "Invalid domain name."
    }
}

variable "source_repo" {
    description = "GitHub repo containing site source (example-user/example-repo)"
}

variable "source_branch" {
    description = "Branch of repo to use"
}

variable "source_dir" {
    description = "Directory within repo containg site source"
}

variable "output_dir" {
    description = "Directory where site files can be found post-build"
}

variable "build_command" {
    description = "Command to build site from source"
}

variable "preview_source_branch" {
    description = "Branch of repo to use for development preview"
}

variable "manage_dns" {
    description = "Should this module manage DNS via Cloudflare (true/false)"
    default = false
    validation {
      condition = can(regex("^true$|^false$", var.manage_dns))
      error_message = "Must be one of true/false."
    }
}

variable "cloudflare_zone_id" {
    description = "Zone ID of the Cloudflare domain to setup"
    default = "null"
}