
PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: i-requirements
i-requirements: ## Install Kind, kubectl, istioctl.
	./1_install_requirements.sh

.PHONY: c-cluster
c-cluster: ## Create cluster with kind.
	./2_create_kind_cluster.sh

.PHONY: i-knative
i-knative: ## Install knative components, as serving and eventing
	./3_install_knative.sh && ./4_install_knative_kourier.sh

.PHONY: i-kourier
i-kourier: ## Install kourier
	./4_install_knative_kourier.sh

.PHONY: u-knative
u-knative: ## Uninstall knative.
	./10_uninstaller_native.sh	

.PHONY: i-metrics
i-metrics: ## Install prometheus and collector to monitorize knative.
	./5_install_metrics.sh

.PHONY: r-helloworld
r-helloworld: ## Run helloworld service.
	./6_run_helloworld.sh

