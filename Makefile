init: 
	npm ci

build-docker:
	docker build --build-arg PALETTE_VERSION=$(VERSION) --build-arg PALETTE_CLI_VERSION=$(VERSION) -t tutorials .