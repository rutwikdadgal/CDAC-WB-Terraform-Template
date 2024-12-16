terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "CDAC_TF-Template-Deployment"

    workspaces {
      name = "CDAC-WB-Terraform-Template"
    }
  }
}
