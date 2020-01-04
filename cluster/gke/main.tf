provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_container_cluster" "terraform" {
  name     = var.cluster.name

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.node_pool.name
  cluster    = google_container_cluster.terraform.name
  initial_node_count = var.node_pool.initial_node_count

  autoscaling {
    min_node_count = var.node_pool.min_node_count
    max_node_count = var.node_pool.max_node_count
  }

  node_config {
    preemptible  = var.node_pool.preemptible
    machine_type = var.node_pool.machine_type
    disk_size_gb = var.node_pool.disk_size_gb
  }
}
