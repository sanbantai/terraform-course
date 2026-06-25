output "iam_policy" {
  value = data.aws_iam_policy_document.static_website.json
}