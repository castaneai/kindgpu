up:
	kind create cluster --name kindgpu

install-driver:
	kubectx kindgpu
	kubectl apply -f driver-installer.yaml

down:
	kind delete cluster --name kindgpu
