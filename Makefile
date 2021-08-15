
up-ncr:
	kind create cluster --config kind.yaml
	kubectl apply -f ncr/driver-installer.yaml
	sleep 20
	kubectl -n kube-system wait pod -l app=driver-installer --for condition=Ready --timeout=600s

apply-ncr: build
	kubectl replace --force --grace-period=0 -f ncr/vulkan-pod.yaml

up-cea:
	kind create cluster --config kind.yaml
	kubectl apply -f cea/driver-installer.yaml
	sleep 20
	kubectl -n kube-system wait pod -l app=driver-installer --for condition=Ready --timeout=600s
	kubectl apply -f cea/device-plugin.yaml

apply-cea: build
	kubectl replace --force --grace-period=0 -f cea/vulkan-pod.yaml

.PHONY: build
build:
	docker build -t vulkan-app:fixed ./common/vulkan-app
	docker build -t xserver:fixed ./common/xserver
	kind load docker-image --name kindgpu --nodes kindgpu-worker vulkan-app:fixed xserver:fixed

down:
	kind delete cluster --name kindgpu
