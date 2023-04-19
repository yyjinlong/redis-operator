
CONTROLLER_GEN := controller-gen

manifest:
	$(CONTROLLER_GEN) crd paths="./..." output:crd:artifacts:config=/opt

image:
	@echo "docker build ...."
	docker build -t $(IMAGE_PATH):$(IMAGE_VERSION) .
	@echo "docker tag...."
	docker tag $(IMAGE_PATH):$(IMAGE_VERSION) $(IMAGE_PATH):$(IMAGE_VERSION)
	@echo "docker push...."
	docker push $(IMAGE_PATH):$(IMAGE_VERSION)

help:

	@echo "make manifest 之后: vimdiff /opt/databases.spotahome.com_redisfailovers.yaml manifests/databases.spotahome.com_redisfailovers.yaml"
	@echo "make image IMAGE_PATH=10.12.28.4:80/service/redis-operator IMAGE_VERSION=1.1.1"

