provider "google" {
  project = "sonic-totem-416019"
  region  = "us-central1"
  credentials = sonic-totem-416019-ec8bab8f9e6a.json
}

data "google_client_config" "default" {}

resource "google_container_cluster" "main" {
  name               = "my-gke-cluster"
  location           = "us-central1"
  initial_node_count = 2

  node_config {
    machine_type = "e2-medium"
  }
}
