FROM --platform=linux/amd64 alpine:3.16.2

LABEL Maintainer="0xSte <https://github.com/0xSte>"
LABEL Name="grok_exporter"

RUN apk add --no-cache libzmq bash libc6-compat
RUN apk add --no-cache -t .build-deps wget ca-certificates gnupg openssl


ARG GROK_RELEASE="1.0.0.RC5"
ARG GROK_DISTRO="linux-amd64"
ARG GROK_CONFIG_FILE="/grok/config.yml"

RUN wget https://github.com/fstab/grok_exporter/releases/download/v$GROK_RELEASE/grok_exporter-$GROK_RELEASE.$GROK_DISTRO.zip

RUN unzip ./grok_exporter-$GROK_RELEASE.$GROK_DISTRO.zip
RUN ls -ltra
RUN mv grok_exporter-$GROK_RELEASE.$GROK_DISTRO /grok
RUN rm grok_exporter-$GROK_RELEASE.$GROK_DISTRO.zip
RUN mkdir -p /etc/grok_exporter
RUN ln -sf /etc/grok_exporter/config.yml /grok/
WORKDIR /grok

CMD ["./grok_exporter", "-config", "${GROK_CONFIG_FILE}"]
