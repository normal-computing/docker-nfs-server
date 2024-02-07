# syntax=docker/dockerfile:1.4

FROM alpine:3.18

ENV LANG en_US.utf8

RUN <<EOF
    set -eu

    apk add --no-cache nfs-utils
EOF

EXPOSE 2049

COPY nfs-server /usr/local/bin
ENTRYPOINT ["/usr/local/bin/nfs-server"]
