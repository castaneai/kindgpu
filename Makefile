up:
	kind create cluster --config kind.yaml

install-driver:
	kubectx kind-kindgpu
	kubectl apply -f driver-installer.yaml

install-device-plugin:
	kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/container-engine-accelerators/master/cmd/nvidia_gpu/device-plugin.yaml

.PHONY: vulkan-pod
vulkan-pod:
	docker build -t vulkan-pod-app:fixed ./vulkan-pod/app
	docker build -t vulkan-pod-xserver:fixed ./vulkan-pod/xserver
	kind load docker-image --name kindgpu --nodes kindgpu-worker vulkan-pod-app:fixed vulkan-pod-xserver:fixed
	kubectl apply -f vulkan-pod/vulkan-pod.yaml

down:
	kind delete cluster --name kindgpu
