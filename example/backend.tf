# Example for yandex cloud s3 backend storage

terraform {
  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"

    # Create S3 bucket
    # https://cloud.yandex.ru/docs/storage/operations/buckets/create
    bucket                      = "< Bucket name >"
    region                      = "< Backet region >"
    key                         = "< path/name.tfstate >"

    # Create service account and access key
    # https://cloud.yandex.ru/docs/iam/operations/sa/create
    # https://cloud.yandex.ru/docs/iam/operations/sa/create-access-key
    access_key                  = "< Service account kye id >"
    secret_key                  = "< Service account key >"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}