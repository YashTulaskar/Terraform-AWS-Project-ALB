terraform {
  backend "s3" {
    bucket = "yash-bucket-terraform-state"
    key    = "path/to/my/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}
