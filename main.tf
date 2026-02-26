module "github_oidc" {
  source = "git::https://github.com/vijaya49/Terraform-Modules.git//github-oidc?ref=main"

  github_org  = "vijaya49"
  github_repo = "Static-Web-Hosting"
  branch      = "main"

  role_name   = "github-s3-deploy-role"
  policy_name = "github-s3-static-hosting-policy"

  policy_statements = [

    # Allow bucket level access
    {
      Effect = "Allow"
      Action = [
        "s3:ListBucket",
        "s3:GetBucketLocation"
      ]
      Resource = "arn:aws:s3:::Static-Web-Hosting-Vijay49"
    },

    # Allow object level access
    {
      Effect = "Allow"
      Action = [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ]
      Resource = "arn:aws:s3:::Static-Web-Hosting-Vijay49/*"
    },

    # Optional: if creating bucket via Terraform
    {
      Effect = "Allow"
      Action = [
        "s3:CreateBucket",
        "s3:PutBucketPolicy",
        "s3:PutBucketWebsite",
        "s3:PutBucketPublicAccessBlock"
      ]
      Resource = "arn:aws:s3:::Static-Web-Hosting-Vijay49/*"
    }
  ]
}