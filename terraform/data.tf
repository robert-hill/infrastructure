data "aws_route53_zone" "decentlabs" {
  name = "decentlabs.com"
}

data "aws_s3_bucket" "terraform" {
  bucket = "rhill-terraform"
}