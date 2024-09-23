.PHONY: license

init: ## Install dependencies and setup the project
	@echo "initializing npm dependencies"
	npm ci
	npx husky install


help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[0m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)



build-docker: ## Build docker image
	@echo "Building docker image"
	docker build --build-arg PALETTE_VERSION=$(PALETTE_VERSION) \
	 --build-arg PALETTE_CLI_VERSION=$(PALETTE_CLI_VERION) \
	--build-arg PALETTE_EDGE_VERSION=$(PALETTE_EDGE_VERSION) \
	--build-arg PACKER_VERSION=$(PACKER_VERSION) \
	--build-arg ORAS_VERSION=$(ORAS_VERSION) \
	--build-arg TERRAFORM_VERSION=$(TERRAFORM_VERSION) \
	--build-arg K9S_VERSION=$(K9S_VERSION) \
	 -t tutorials .


license: ## Adds a license header to all files. Reference https://github.com/hashicorp/copywrite to learn more.
	@echo "Applying license headers..."
	 copywrite headers	