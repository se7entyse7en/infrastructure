.PHONY: build-cluster
build-cluster:
	cd cluster/gke && terraform apply -var-file=all.tfvars

.PHONY: destroy-cluster
destroy-cluster:
	cd cluster/gke && terraform destroy -var-file=all.tfvars
