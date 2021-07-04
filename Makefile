include .env

config= --env-file .env
DOCKER_IMAGE_KNATIVE=${DOCKER_REGISTRY}/${DOCKER_REPOSITORY_KNATIVE}

PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: d-build
d-build: ## DOCKER Build image using maven build plugin
	docker build . --no-cache -t ${DOCKER_IMAGE_KNATIVE}:${TAG} -f ./knative/helloworld-go/Dockerfile

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

.PHONY: k-info
k-info: ## HELM status show the current release status
	kubectl get pods --namespace $(HELM_NAMESPACE)

.PHONY: knative-install ## Install all the knative components in the cluster
knative-install: ./knative/scripts/install_knative.sh

.PHONY: knative-install-kourier ## Install all the knative components in the cluster
knative-install-kourier: ./knative/scripts/install_knative_kourier.sh

.PHONY: knative-build
knative-build: d-build ## App BUILD , means --> (go full process) AND (Create the DOCKER Image)

.PHONY: knative-serve
knative-serve: d-push  ## App SERVE

.PHONY: knative-event
knative-event: d-push h-lint h-package ## App EVENT

.PHONY: knative-uninstall
knative-uninstall: knative