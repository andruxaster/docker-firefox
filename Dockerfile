FROM debian:stable-slim

# ENVIRONMENT VARIABLES
ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=8080 \
    VNC_COL_DEPTH=32 \
    VNC_RESOLUTION=1280x1024 \
    DEBIAN_FRONTEND=noninteractive \
    TERM=xterm

# INSTALL DEPENDENCIES
RUN apt update && \
    apt install --no-install-recommends -y \
    git xvfb xauth xterm icewm libxtst6 nginx \
    wget sudo git bzip2 novnc python3-websockify ca-certificates \
    tigervnc-standalone-server tigervnc-common firefox-esr; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /src
COPY entrypoint.sh /src
COPY icewm /etc/X11/icewm
COPY nginx.conf /etc/nginx

EXPOSE 5901 8080 5800
ENTRYPOINT ["/src/entrypoint.sh"]