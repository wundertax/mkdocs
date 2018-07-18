FROM alpine:3.8
LABEL maintainer "Sven <sven@wundertax.de" \
    org.label-schema.vendor = "wundertax"

ENV MKDOCS_VERSION 0.17.3

RUN adduser -s /bin/false -D -H wt \
    && mkdir -p /srv/docs \
    && touch /srv/mkdocs.yml \
    && apk --no-cache add \
    python3 \
    bash \
    tini \
    su-exec \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir --upgrade setuptools \
    && pip3 install --no-cache-dir mkdocs==${MKDOCS_VERSION} \
		pygments \
                mkdocs-material \
                pymdown-extensions

#VOLUME ["/docs/"]

WORKDIR /srv/

COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]

# Expose MkDocs development server port
EXPOSE 8000

# Below settings are used for debug and stuff
#ENTRYPOINT ["bash"]
#ENTRYPOINT ["mkdocs"]
#CMD ["serve", "--dev-addr=0.0.0.0:8000"]
