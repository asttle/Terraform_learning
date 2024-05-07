provider "aws" {
    region = "eu-west-2"
}

provider "aws" {
    region = "ap-south-1"
    alias = "mumbai"
}
