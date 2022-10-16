data "archive_file" "init" {
  type       = "zip"
  source_dir = "../app"
  output_path = "../out/code.zip"
}
