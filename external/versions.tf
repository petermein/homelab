terraform {
  required_version = "~> 1.3.0"

  backend "local" {
    # hostname     = "app.terraform.io"
    # organization = "Infratron"

    # workspaces {
    #   name = "jupiter"
    # }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.26.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.14.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "~> 2.2.0"
    }

    backblaze = {
      source  = "backblaze/b2"
      version = "~> 0.8.1"
    }
  }
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

provider "kubernetes" {
  # Use KUBE_CONFIG_PATH environment variables
  # Or in cluster service account
}
