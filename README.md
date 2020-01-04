# Infrastructure

This repository contains infrastructure as a code for my personal projects.

## Structure

The repository is structured as follows:
- the `cluster/gke` directory contains the Terraform code to create a GKE cluster.
- the `projects` directory contains a subdirectory for each project deployed on the GKE cluster.

## Commands

- `make build-cluster`: builds the GKE cluster configured by variables in `cluster/gke/all.tfvars`.
- `make destory-cluster`: destroys the GKE cluster configured by variables in `cluster/gke/all.tfvars`.
