terraform {
  backend "s3" {
    bucket       = "zuri-market-terraform-state-erobhose-20261004"
    key          = "zuri-market/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}