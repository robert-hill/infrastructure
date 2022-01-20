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
    "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCGgI4iRVM5N18oVIA8qa+1mW/93q81GxF3W+XLEHf+K1kSvIRQwCQZKq/tYBDXy5mTxhd6/SEI2zqCRvcoQD3rJN8hvA91BPpj8XXSMjMfOfsTMEVPunmomKBvac0EGnrj8F40dxLgUCEn0qkoHZmC7aNaIdb/aFZeR2YuBoUcEQIDAQAB"
  ]
  ttl = var.standard_ttl
}