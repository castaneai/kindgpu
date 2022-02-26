FROM ubuntu:20.04

RUN apt update -y && apt install -y vulkan-tools mesa-utils libxext6

COPY nvidia_icd.json /usr/share/vulkan/icd.d/
COPY 10_nvidia.json /usr/share/glvnd/egl_vendor.d/