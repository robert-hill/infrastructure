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
  name = data.aws_route53_zone.decentlabs.name
  type = "MX"
  records = [
    "10 ASPMX.L.GOOGLE.COM",
    "20 ALT1.ASPMX.L.GOOGLE.COM",
    "30 ALT2.ASPMX.L.GOOGLE.COM",
    "40 ALT3.GOOGLEMAIL.COM",
    "50 ALT4.GOOGLEMAIL.COM",
  ]
  ttl = "${var.standard_ttl}"
}