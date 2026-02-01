FROM projectoss/alpine:3.21

LABEL organization="projectoss" \
      maintainer="projectoss-dinushchathurya" \
      description="Docker image for Helm"

ARG HELM_VERSION=v4.1.0
ARG TARGETOS
ARG TARGETARCH

ENV HELM_HOME=/opt/helm

RUN set -eux; \
    apk add --no-cache \
      ca-certificates \
      bash \
      git \
      gnupg \
      jq \
      curl \
      gettext; \
    \
    curl -fsSL https://get.helm.sh/helm-${HELM_VERSION}-${TARGETOS}-${TARGETARCH}.tar.gz \
      | tar -xz; \
    \
    mv ${TARGETOS}-${TARGETARCH}/helm /usr/local/bin/helm; \
    chmod +x /usr/local/bin/helm; \
    rm -rf ${TARGETOS}-${TARGETARCH}; \
    \
    mkdir -p ${HELM_HOME}; \
    chmod a+rwx ${HELM_HOME}

WORKDIR /opt
CMD ["bash"]
