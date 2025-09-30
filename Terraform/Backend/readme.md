
````
terraform {
    backend "s3" {
        bucket = "oncdec-b29-dev-tf-remote-backend"
        key = "backup/terraform.tfstate"
        region = "eu-north-1"
        profile = "tf-user"

    }
}

````
