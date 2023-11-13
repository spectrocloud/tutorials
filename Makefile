init: ## Install dependencies and setup the project
	@echo "initializing npm dependencies"
	npm ci
	npx husky install


help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[0m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)



build-docker: ## Build docker image
	@echo "Building docker image"
	docker build --build-arg PALETTE_VERSION=$(VERSION) --build-arg PALETTE_CLI_VERSION=$(VERSION) --build-arg PALETTE_EDGE_VERSION=$(EDGE) --build-arg PACKER_VERSION=1.8.7 -t tutorials .