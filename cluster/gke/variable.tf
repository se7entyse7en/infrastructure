variable "project" {
  type = string
}

variable "credentials_file" {
  type = string
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "zone" {
  type = string
  default = "us-central1-a"
}

variable "cluster" {
  type = object({
    name = string
  })

}

variable "node_pool" {
  type = object({
    name = string
    initial_node_count = number
    min_node_count = number
    max_node_count = number
    preemptible = bool
    machine_type = string
    disk_size_gb = number
  })
}
