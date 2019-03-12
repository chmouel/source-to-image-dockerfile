REGISTRY=quay.io/chmouel/source-to-image

all: build

build:
	docker build . -t $(REGISTRY) && docker push $(REGISTRY)
