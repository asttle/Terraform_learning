data "local_file" "data_source" {
  filename = "${path.module}/demo.txt" // path.module reefers to the current directory
}

output "data" {
  value = data.local_file.data_source.content
}