.PHONY: build dev run

OCI_TOOL=$(shell command -v podman || command -v docker)

build: dev
	$(OCI_TOOL) buildx create --use
	$(OCI_TOOL) buildx build --push --platform linux/amd64,linux/arm64,linux/arm64/v8 -t quay.io/omaciel/ykibooks:latest -t quay.io/omaciel/ykibooks:v0.1 .
	$(OCI_TOOL) buildx stop
	$(OCI_TOOL) buildx rm

dev:
	npm install

run:
	npm start

help:
	@echo "Please use \`make <target>' where <target> is one of:"
	@echo ""
	@echo "--- General Commands ---"
	@echo "build		Build and push new images to Quay.io."
	@echo "dev			Install development tools and dependencies."
	@echo "run 			Spin up a lab with 1 controller and 2 hosts."
