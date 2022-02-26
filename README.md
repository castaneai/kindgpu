Running vulkan apps on kind k8s cluster

## `ncr`: nvidia-container-runtime

```sh
make up-ncr
make apply-ncr

# show vkcube
open vnc://localhost:5900
```


## `cea`: container-engine-accelerators (Google Cloud Platform)

```sh
make up-cea
make apply-cea

# show vkcube
open vnc://localhost:5900
```

on GKE

```sh
make build-gke
make up-gke-cea
make apply-gke-cea
kubectl port-forward vulkan-pod 5900:5900
open vnc://localhost:5900
```
