data "aws_route53_zone" "decentlabs" {
  name = aws_route53_zone.decentlabs.name
}

data "aws_s3_bucket" "terraform" {
  bucket = "rhill-terraform"
}