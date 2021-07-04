include .env

config= --env-file .env
DOCKER_IMAGE_KNATIVE=${DOCKER_REGISTRY}/${DOCKER_REPOSITORY_KNATIVE}
CLUSTER_NAME=kind-knative
PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: install-tooling
install-tooling: ## install tooling required, Kind , Kubectl , make ..
	./common_scripts/install_requirements.sh

.PHONY: install-serverless-framework
install-serverless-framework: ## install severless
	./common_scripts/install_serverless_framework.sh

.PHONY: create-cluster
create-cluster: ## Create Kind Cluster
	cd ./common_scripts && ./create_kind_cluster.sh ${CLUSTER_NAME}

.PHONY: delete-cluster
delete-cluster: ## Delete Kind Cluster
	./common_scripts/delete_kind_cluster.sh ${CLUSTER_NAME}

.PHONY: d-build
d-build: ## DOCKER Build image using maven build plugin
	cd ./knative/helloworld-go/ && docker build --no-cache -t ${DOCKER_IMAGE_KNATIVE}:${TAG} .

.PHONY: d-scan
d-scan: ## DOCKER Scan Image
	docker scan  ${DOCKER_IMAGE_KNATIVE}:${TAG}

.PHONY: d-run
d-run: ## DOCKER Run default ports
	docker run --rm --name ${CONTAINER_NAME} ${DOCKER_IMAGE}:${TAG} -p ${LOCAL_PORT}:${CONTAINER_PORT}  -p 8443:8443

.PHONY: d-push
d-push: ## DOCKER Push run default ports
	docker push  ${DOCKER_IMAGE_KNATIVE}:${TAG}

.PHONY: d-stop
d-stop: ## DOCKER Stop all containers.
	docker stop $(docker ps -q)

.PHONY: d-kill
d-kill: ## DOCKER Kill all containers.
	 docker kill $(docker ps -q)

.PHONY: d-rm
d-rm: ## DOCKER Removes all containers.
	docker rm $(docker ps -a -q)

.PHONY: d-rmi
d-rmi: ## DOCKER Removes all images.
	docker rmi $(docker images -a -q)

.PHONY: d-rmdi
d-rmdi: ## DOCKER Removes dangling images.
	docker rmi $(docker images -a --filter=dangling=true -q)

.PHONY: d-rm-exited-containers
d-rm-exited-containers: ## DOCKER Removes containers that are done.
	docker rm -v $(docker ps -a -q -f status=exited)

.PHONY: d-prune
d-prune: d-kill ## DOCKER Removes containers that are done.
	docker system prune

.PHONY: knative-install
knative-install: knative-install-components knative-install-kourier ## Install and configure Knative in the cluster


.PHONY: knative-install-components
knative-install-components: ## Install all the knative components in the cluster
	cd ./knative/scripts/ && ./install_knative.sh

.PHONY: knative-install-kourier
knative-install-kourier: ## Install all the knative components in the cluster
	cd ./knative/scripts/ && ./install_knative_kourier.sh
.PHONY: knative-uninstall
knative-uninstall:  ## UnInstall all the knative components in the cluster
	./knative/scripts/uninstall_knative.sh

.PHONY: knative-build
knative-build: d-build ## App BUILD , means --> (go full process) AND (Create the DOCKER Image)

.PHONY: knative-serve
knative-serve: d-push  ## App SERVE

.PHONY: knative-event
knative-event: d-push h-lint h-package ## App EVENT

.PHONY:bash-exec-perm
bash-exec-perm: chmod u+x ./**/*.sh

.PHONY: install-monitoring-stack
install-monitoring-stack: ## Install monitoring stack (Prometheus, Grafana)
	./common_scripts/install_prometheus_operator.sh

.PHONY: update-prometheus-config
update-prometheus-config: ## Update Prometheus configuration
	helm upgrade prometheus-stack ./kube-prometheus-stack/ -n metrics
