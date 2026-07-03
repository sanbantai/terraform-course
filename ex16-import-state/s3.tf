resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraform-course-ilyagruzman-some-bucket-best-one"

  tags = {
    ManagedBy = "Terraform"
    Lifecycle = "Critical"
  }
}