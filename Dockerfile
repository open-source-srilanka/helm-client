FROM projectoss/alpine:3.21

LABEL org.opencontainers.image.title="Helm Client" \
      org.opencontainers.image.description="Production-grade Helm CLI container" \
      org.opencontainers.image.vendor="projectoss" \
      org.opencontainers.image.maintainer="projectoss-dinushchathurya" \
      org.opencontainers.image.source="https://github.com/open-source-srilanka/helm-client"

ARG HELM_VERSION=v4.1.0
ARG TARGETOS
ARG TARGETARCH

ENV HELM_HOME=/opt/helm \
    HELM_CACHE_HOME=/opt/helm/cache \
    HELM_CONFIG_HOME=/opt/helm/config \
    HELM_DATA_HOME=/opt/helm/data

RUN set -eux; \
    apk add --no-cache \
      ca-certificates \
      bash \
      git \
      gnupg \
      jq \
      curl \
      gettext \
      openssl; \
    update-ca-certificates

RUN set -eux; \
    curl -fsSLO https://get.helm.sh/helm-${HELM_VERSION}-${TARGETOS}-${TARGETARCH}.tar.gz; \
    curl -fsSLO https://get.helm.sh/helm-${HELM_VERSION}-${TARGETOS}-${TARGETARCH}.tar.gz.sha256sum; \
    sha256sum -c helm-${HELM_VERSION}-${TARGETOS}-${TARGETARCH}.tar.gz.sha256sum; \
    tar -xzf helm-${HELM_VERSION}-${TARGETOS}-${TARGETARCH}.tar.gz; \
    mv ${TARGETOS}-${TARGETARCH}/helm /usr/local/bin/helm; \
    chmod 0755 /usr/local/bin/helm; \
    rm -rf helm-${HELM_VERSION}-${TARGETOS}-${TARGETARCH}*

RUN addgroup -S helm && adduser -S helm -G helm; \
    mkdir -p ${HELM_HOME}; \
    chown -R helm:helm ${HELM_HOME}

USER helm
WORKDIR /opt

ENTRYPOINT ["helm"]
CMD ["version"]

