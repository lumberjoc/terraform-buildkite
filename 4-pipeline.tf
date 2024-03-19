
resource "buildkite_pipeline" "buildkite_aws" {
    name = "terraform-buildkite"
    repository = "https://github.com/lumberjoc/terraform-buildkite.git"
    default_branch = "main"
    cluster_id = "Q2x1c3Rlci0tLWVhNGU4YzMwLWUzNWQtNDcxNy04NjI3LWY3MzNhZWM2NWViNg=="
    steps = <<STEPS
steps:
  - label: ':pipeline:'
    command: buildkite-agent pipeline-upload
    STEPS
}


# FOR CREATING NEW CLUSTER AND QUEUE
# Issue: Wasn't able to connect agent to 
# the new cluster even after generating a
# new token. 

# resource "buildkite_cluster" "primary" {
#     name = "Primary cluster"
#     description = "Runs build and deploys"
# }
#
# resource "buildkite_cluster_queue" "primary" {
#   cluster_id = buildkite_cluster.primary.id
#   key        = "primary"
# }


