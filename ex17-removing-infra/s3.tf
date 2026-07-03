resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-blabalakjfoahfoh"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
