all: docker-images usersvc.yaml

VERSION=0.1.0

.ALWAYS:

docker-images: usersvc-image

usersvc-image: .ALWAYS
	docker build -t dwflynn/usersvc:$(VERSION) .
	if [ -n "$(DOCKER_REGISTRY)" ]; then \
		docker push $(DOCKER_REGISTRY)/usersvc:$(VERSION); \
	fi
