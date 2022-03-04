<<<<<<< HEAD
data "cloudflare_zone" "mein_nl" {
  zone_id = "f2dbeb2dca3e055df71df866b8188ce7"
=======
data "cloudflare_zone" "zone" {
  name = "khuedoan.com"
>>>>>>> be9817458ca90384f21059c81ae3168cbac6237e
}

data "cloudflare_api_token_permission_groups" "all" {}

data "http" "public_ipv4" {
  url = "https://ipv4.icanhazip.com"
}

# data "http" "public_ipv6" {
#   url = "https://ipv6.icanhazip.com"
# }

locals {
  public_ips = [
    "${chomp(data.http.public_ipv4.body)}/32",
    # "${chomp(data.http.public_ipv6.body)}/128"
  ]
}
