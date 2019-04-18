FROM alpine:3.9

RUN apk --update add python py-setuptools py-pip && \
    pip install elasticsearch-curator==4.3.1 && \
    pip install certifi && \
    apk del py-pip && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/curator_cli"]
