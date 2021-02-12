resource "null_resource" "example2" {
  provisioner "local-exec" {
    command = "echo "${FOO}" >>" "env_vars.txt"

    environment = {
      FOO = "bar"
      BAR = 1
      BAZ = "true"
    }
  }
}