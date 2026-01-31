terraform {
  backend "s3" {
    bucket = "bucketinfo23"
    key    = "sample/terraform.tfstate"
    region = "us-east-1"
  }
}

output "test"{
  value="Hello"
}