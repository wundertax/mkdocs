FROM alpine:latest
LABEL maintainer "Sven <sven@testthedocs.org>" \
    org.label-schema.vendor = "TestTheDocs"

ENV MKDOCS_VERSION 0.17.3

RUN adduser -s /bin/false -D -H ttd \
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

VOLUME ["/docs/"]

WORKDIR /docs/

COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh
#COPY dockerfiles/Makefile /docs/Makefile

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]

# Expose MkDocs development server port
EXPOSE 8000

#ENTRYPOINT ["mkdocs"]
#CMD ["serve", "--dev-addr=0.0.0.0:8000"]