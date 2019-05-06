FROM alpine:latest
LABEL maintainer="Wundertax Tech <devops@wundertax.de>" \
      org.label-schema.name="mkdocs" \
      org.label-schema.description="Mkdocs processor." \
      org.label-schema.vendor="Wundertax GmbH" \
      org.label-schema.docker.cmd="docker run -d wundertax/mkdocs:latest build"

ENV MKDOCS_VERSION 1.0.4

RUN adduser -s /bin/false -D -H wt \
    && apk --no-cache add \
    python3 \
    bash \
    tini \
    su-exec \
    ca-certificates \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir --upgrade setuptools \
    && pip3 install --no-cache-dir mkdocs==${MKDOCS_VERSION} \
		pygments \
    mkdocs-material \
    pymdown-extensions

VOLUME ["/docs/"]

WORKDIR /docs/

COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]

# Expose MkDocs development server port
EXPOSE 8000

# Below settings are used for debug and stuff
#ENTRYPOINT ["mkdocs"]
#CMD ["serve", "--dev-addr=0.0.0.0:8000"]
