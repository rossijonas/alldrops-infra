# -----------------------------------------------------------------------------
# generate inputs
# -----------------------------------------------------------------------------

locals {
  bucket_name = "${var.bucket_name}-${random_pet.this.id}"
}

resource "random_pet" "this" {
  length = 2
  keepers = {
    # Generate new random_pet only when var.bucket_name is changed
    bucket_name = "${var.bucket_name}"
  }
}
