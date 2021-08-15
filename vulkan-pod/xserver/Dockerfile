FROM ubuntu:20.10

ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y && apt install -y \
        x11-xserver-utils \
        xserver-xorg-video-dummy \
        x11vnc \
        dbus-x11 \
        libxrandr-dev \
        pciutils && \
    rm -rf /var/lib/apt/lists/

# Remove libnss-systemd because it causes the dbus-daemon startup to hang for 90s.
RUN apt remove -y libnss-systemd

# Set the DISPLAY variable.
ENV DISPLAY :0

COPY xorg*.conf /etc/X11/
COPY entrypoint*.sh /
RUN chmod +x /entrypoint*.sh

VOLUME /var/run/appconfig

ENTRYPOINT ["/entrypoint.sh"]