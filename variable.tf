provider "google" {
  project = "sonic-totem-416019"
  region  = "us-central1"
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

provider "kubernetes" {
  host                   = google_container_cluster.main.endpoint
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.main.master_auth.0.cluster_ca_certificate)
}

