init: 
	npm ci

build-docker:
	@echo "Building docker image"
	docker build --build-arg PALETTE_VERSION=$(PALETTE_VERSION) --build-arg PALETTE_CLI_VERSION=$(PALETTE_CLI_VERSION) --build-arg PALETTE_EDGE_VERSION=$(PALETTE_EDGE_VERSION) --build-arg PACKER_VERSION=1.8.7 -t tutorials .