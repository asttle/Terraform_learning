terraform {
    backend "s3" {
        bucket = "terraform-tfstate-store-backend"
        key    = "mylabs/terraform.tfstate"
        region = "eu-west-2"
    }
}