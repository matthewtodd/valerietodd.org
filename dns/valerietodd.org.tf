# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone
resource "aws_route53_zone" "main" {
  name = "valerietodd.org"
}

output "name_servers" {
  value = aws_route53_zone.main.name_servers
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
resource "aws_route53_record" "a" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "valerietodd.org"
  type    = "A"
  ttl     = 3600
  records = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153"
  ]
}

resource "aws_route53_record" "aaaa" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "valerietodd.org"
  type    = "AAAA"
  ttl     = 3600
  records = [
    "2606:50c0:8000::153",
    "2606:50c0:8001::153",
    "2606:50c0:8002::153",
    "2606:50c0:8003::153"
  ]
}

resource "aws_route53_record" "mx" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "valerietodd.org"
  type    = "MX"
  ttl     = 3600
  records = [
    "1 smtp.google.com.",
    "15 6ry7ut43vtxghvtw2qo4v2kcpwil5wszn3yayjsoceioppearapa.mx-verification.google.com."
  ]
}

resource "aws_route53_record" "spf" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "valerietodd.org"
  type    = "SPF"
  ttl     = 3600
  records = ["v=spf1 include:_spf.google.com ~all"]
}

resource "aws_route53_record" "txt" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "valerietodd.org"
  type    = "TXT"
  ttl     = 3600
  records = ["v=spf1 include:_spf.google.com ~all"]
}

resource "aws_route53_record" "dmarc" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "_dmarc.valerietodd.org"
  type    = "TXT"
  ttl     = 3600
  records = ["v=DMARC1; p=reject"]
}

resource "aws_route53_record" "github_pages_challenge" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "_github-pages-challenge-matthewtodd.valerietodd.org"
  type    = "TXT"
  ttl     = 3600
  records = ["7c95ff0cac53314b7837fac5839812"]
}

resource "aws_route53_record" "domainkey" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "google._domainkey.valerietodd.org"
  type    = "TXT"
  ttl     = 3600
  records = ["v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxeWCAfQp6HdIJiaAd6RqD6Gbrw1zqxxYMsyC\"\"im2j9HG6DF5DlMeZp0T5Wv7soaipNhgSO/sjqJgy8kpJs8OkvvTm9QhplIPqZ1qkJjoDN4Ji7jBSyHQ9\"\"kIgLnq3OJJraC3ndXbK7JoFE49DdW4RFID27oCH+0jnJLivBZBEeEQk/Rqw5BmYClHXcKxt2mpiO7px6\"\"tioXldfbW/3JBH2I2Ow7OEPX1hS2vTbI2g7SpUic5Jh1khn5+DG/FKSXcrdlIZTeT+OMEYwcwKDp368U\"\"AVkFiJ43QzWa4Oinkzz4k4VbxeUh1CgxkDtziKqmNR2K574IBnpeWBAfbheCmZ9TjwIDAQAB"]
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.valerietodd.org"
  type    = "CNAME"
  ttl     = 3600
  records = ["ghs.googlehosted.com"]
}
