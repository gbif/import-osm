VERSION := $(shell cat VERSION)
DOCKER_IMAGE := gbif/import-osm

.PHONY: build

build:
	@echo "Build: $(VERSION)"
	docker build -f Dockerfile      -t $(DOCKER_IMAGE):$(VERSION)      .
	docker images | grep $(DOCKER_IMAGE) | grep $(VERSION)

release:
	@echo "Release: $(VERSION)"
	docker pull golang:1.7
	docker build -f Dockerfile      -t $(DOCKER_IMAGE):$(VERSION)      .
	docker images | grep $(DOCKER_IMAGE) | grep $(VERSION)
