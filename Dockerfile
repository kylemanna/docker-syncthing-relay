FROM alpine:latest
MAINTAINER Kyle Manna <kyle@kylemanna.com>

# Busybox wget needs TLS support, curl is less painful to get working
RUN apk add --update curl && \
    curl -L https://build.syncthing.net/job/strelaysrv/lastSuccessfulBuild/artifact/strelaysrv-linux-amd64-v0.14.8+11-g29ccf10.tar.gz | tar xzf - && \
    apk del --rdepends curl && \
    cp strelaysrv-linux-amd64-v0.14.8+11-g29ccf10/strelaysrv /usr/local/bin/ && \
    rm -rf strelaysrv-linux-amd64-v0.14.8+11-g29ccf10 && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

# Run unprivileged out of /relaysrv
RUN mkdir /relaysrv && chown nobody:nobody /relaysrv
USER nobody
WORKDIR /relaysrv

EXPOSE 22067 22070

CMD ["/usr/local/bin/strelaysrv"]
