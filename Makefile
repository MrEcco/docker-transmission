IMAGE_NAME=mrecco/transmission
IMAGE_TAG=4.0.4

BUILDARGS :=
BUILDARGS += --build-arg THEME=dark

build:
	@docker build --pull $(BUILDARGS) -t $(IMAGE_NAME):$(IMAGE_TAG) --platform linux/amd64 -f Dockerfile .
	# @docker build --pull $(BUILDARGS) -t $(IMAGE_NAME):$(IMAGE_TAG) --platform linux/arm64 -f Dockerfile .
	# @docker build --pull $(BUILDARGS) -t $(IMAGE_NAME):$(IMAGE_TAG) --platform linux/arm/v7 -f Dockerfile .

rmi:
	@docker rmi $(IMAGE_NAME):$(IMAGE_TAG)

run:
	@docker run --rm -it -p 9091:9091 $(IMAGE_NAME):$(IMAGE_TAG)

exec:
	@docker run --rm -it -p 9091:9091 --entrypoint "" $(IMAGE_NAME):$(IMAGE_TAG) sh
