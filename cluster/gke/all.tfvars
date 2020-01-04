project = "se7entyse7en-playground"
credentials_file = "credentials.json"

cluster = {
  "name": "my-gke-terraform-cluster"
}

node_pool = {
  "name": "my-gke-terraform-node-pool",
  "initial_node_count": 1,
  "min_node_count": 1,
  "max_node_count": 3,
  "preemptible": true,
  "machine_type": "e2-small",
  "disk_size_gb": 10
}
