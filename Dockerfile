FROM arm64v8/python:3.6-alpine

RUN apt-get update \
  && apt-get install -y wget python3-tk \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app && mkdir /data \
  && /usr/bin/wget http://otgw.tclcode.com/download/otmonitor-aarch64 -O /app/otmonitor \
  && chmod +x /app/otmonitor

CMD ["/app/otmonitor", "--daemon", "-f", "/data/otmonitor.conf"]
