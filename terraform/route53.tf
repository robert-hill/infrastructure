# Zones

# decentlabs.com

resource "aws_route53_zone" "decentlabs" {
  name = "decentlabs.com"
}

# n0syn.com

resource "aws_route53_zone" "n0syn" {
  name = "n0syn.com"
}

# Email

# decentlabs.com

resource "aws_route53_record" "main" {
  zone_id = aws_route53_zone.decentlabs.id
  name    = data.aws_route53_zone.decentlabs.name
  type    = "MX"
  records = [
    "10 ASPMX.L.GOOGLE.COM",
    "20 ALT1.ASPMX.L.GOOGLE.COM",
    "30 ALT2.ASPMX.L.GOOGLE.COM",
    "40 ALT3.GOOGLEMAIL.COM",
    "50 ALT4.GOOGLEMAIL.COM",
  ]
  ttl = var.standard_ttl
}

resource "aws_route53_record" "decentlabs_txt" {
  zone_id = aws_route53_zone.decentlabs.id
  name    = "google._domainkey.${data.aws_route53_zone.decentlabs.name}"
  type    = "TXT"
  records = [
    "v=DKIM1; k=rsa;" "p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC" 
    "AQEAmKTXX++4yXdF7rXqXKx7FGYMDxY1Ipqm6EkN+8scBcp4H7rBTI1yojTFooiP8Xusu0ipXg8COz86NL3KYUiOt0yWlvvNKL/lNMHRKxUKcxxmkQLF5f6Sg/ZozzdKAtVy99b43P9qCaX43oScf+zXIJ6HaKtd4FEtiFUhL130JfrUGAiYgODBO1" 
    "s6ooAe0sFysU4tfawvvABHfauShNG/s/1qp8QKK0kguVe6gxblkeJHQCrrGfxF0vgQcTkOUSPhxaN+bisZB8d+INQGMSdV5PFIQfFBk+nVCq/8155cb/p3zVqS46CbGRN2xkjLc4lizg0RDhdcw6/N22bUlulL4wIDAQAB"
  ]
  ttl = var.standard_ttl
}