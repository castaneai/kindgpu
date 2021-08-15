up:
	kind create cluster --config kind.yaml

install-driver:
	kubectx kind-kindgpu
	kubectl apply -f driver-installer.yaml

.PHONY: vulkan-pod
vulkan-pod:
	docker build -t vulkan-container:fixed ./vulkan-pod
	kind load docker-image --name kindgpu --nodes kindgpu-worker vulkan-container:fixed
	kubectl apply -f vulkan-pod/vulkan-pod.yaml

down:
	kind delete cluster --name kindgpu
