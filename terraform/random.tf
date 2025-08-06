# Generate random value to make resource names globally unique
resource "random_string" "random_suffix" {
  length  = 12
  lower   = true
  numeric = false
  special = false
  upper   = false
}