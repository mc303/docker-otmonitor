FROM docker.io/project31/aarch64-alpine-qemu:3.5-7

RUN [ "cross-build-start" ]

FROM python:3.6

RUN apt-get update \
  && apt-get install -y wget python3-tk \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app && mkdir /data \
  && /usr/bin/wget http://otgw.tclcode.com/download/otmonitor-aarch64 -O /app/otmonitor \
  && chmod +x /app/otmonitor

CMD ["/app/otmonitor", "--daemon", "-f", "/data/otmonitor.conf"]

RUN [ "cross-build-end" ]
