init: 
	npm ci

build-docker:
	@echo "Building docker image"
	docker build --build-arg PALETTE_VERSION=$(VERSION) --build-arg PALETTE_CLI_VERSION=$(VERSION) --build-arg PALETTE_EDGE_VERSION=$(EDGE) --build-arg PACKER_VERSION=1.8.7 -t tutorials .