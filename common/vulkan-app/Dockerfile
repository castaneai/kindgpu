FROM ghcr.io/castaneai/wine:6.13-groovy-i386

RUN apt update -y && apt install -y vulkan-tools mesa-utils

COPY nvidia_icd.json /usr/share/vulkan/icd.d/
COPY 10_nvidia.json /usr/share/glvnd/egl_vendor.d/