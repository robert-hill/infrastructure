module "aws_oidc_github" {
  source = "./modules/terraform-aws-oidc-github"

  github_organisation     = "robert-hill"
  github_repositories     = ["robertallenhill.com", "n0syn.com", "infrastructure"]
  attach_admin_policy     = true
  attach_read_only_policy = false
  tags = {
    "managed_by" = "Terraform"
  }
}