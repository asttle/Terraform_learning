terraform {
    backend "s3" {
        bucket = "terraform-tfstate-store-backend"
        key    = "cross-project/eip.tfstate"
        region = "eu-west-2"
    }
}