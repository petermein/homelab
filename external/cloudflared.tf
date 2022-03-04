resource "random_password" "tunnel_secret" {
  length  = 64
  special = false
}

resource "cloudflare_argo_tunnel" "jupiter" {
  account_id = var.cloudflare_account_id
  name       = "jk"
  secret     = base64encode(random_password.tunnel_secret.result)
}

# Not proxied, not accessible. Just a record for auto-created CNAMEs by external-dns.
resource "cloudflare_record" "tunnel" {
<<<<<<< HEAD
  zone_id = data.cloudflare_zone.mein_nl.id
=======
  zone_id = data.cloudflare_zone.zone.id
>>>>>>> be9817458ca90384f21059c81ae3168cbac6237e
  type    = "CNAME"
  name    = "jupiter-tunnel"
  value   = "${cloudflare_argo_tunnel.jupiter.id}.cfargotunnel.com"
  proxied = false
  ttl     = 1 # Auto
}

resource "kubernetes_secret" "cloudflared_credentials" {
  metadata {
    name      = "cloudflared-credentials"
    namespace = "cloudflared"
  }

  data = {
    "credentials.json" = jsonencode({
      AccountTag   = var.cloudflare_account_id
      TunnelName   = cloudflare_argo_tunnel.jupiter.name
      TunnelID     = cloudflare_argo_tunnel.jupiter.id
      TunnelSecret = base64encode(random_password.tunnel_secret.result)
    })
  }
}
