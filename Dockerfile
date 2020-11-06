FROM debian:9-slim
ADD https://s3.amazonaws.com/translators-connectors-releases/mongomirror/binaries/linux/mongomirror-linux-x86_64-debian92-0.10.0.tgz /mongomirror.tgz
WORKDIR /mongomirror

RUN tar xzf /mongomirror.tgz -C /mongomirror --strip-components=1 && \
    rm -f /mongomirror.tgz && \
    apt-get update && apt-get install -y libssl-dev libsasl2-dev ca-certificates && \
    apt-get clean

ENTRYPOINT ["/mongomirror/bin/mongomirror"]
CMD ["--help"]
