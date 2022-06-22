terraform {
  required_version = "~> 1.2.0"

  backend "local" {

  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.17.0"
    }

    b2 = {
      source  = "Backblaze/b2"
      version = "~> 0.7.0"
      version = "~> 3.11.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.11.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "~> 2.2.0"
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
