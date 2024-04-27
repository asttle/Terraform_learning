data "terraform_remote_state" "eip" {
  backend = "s3"
    config = {
        bucket = "terraform-tfstate-store-backend"
        key    = "cross-project/eip.tfstate"
        region = "eu-west-2"
}
}