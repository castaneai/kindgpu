FROM ubuntu:20.10

RUN apt update -y && apt install -y vulkan-tools libxext6

COPY 10_nvidia.json /usr/share/glvnd/egl_vendor.d/