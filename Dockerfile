FROM golang:alpine
LABEL maintainer="Kyle Manna <kyle@kylemanna.com>"

ENV PKGVER   0.14.45

# Busybox wget needs TLS support, curl is less painful to get working
RUN apk add --update ca-certificates curl && \
    install -d src/github.com/syncthing && \
    export SRCDIR=$PWD && \
    cd src/github.com/syncthing && \
    echo curl -L https://github.com/syncthing/syncthing/releases/download/v$PKGVER/syncthing-source-v${PKGVER}.tar.gz && \
    curl -L https://github.com/syncthing/syncthing/releases/download/v$PKGVER/syncthing-source-v${PKGVER}.tar.gz | tar xzf - && \
    cd syncthing && \
    export GOPATH="$SRCDIR" GOROOT_FINAL="/usr/bin" && \
    go run build.go -no-upgrade -version v${PKGVER} build strelaysrv && \
    install -Dm755 strelaysrv /usr/bin/strelaysrv && \
    rm -rf $SRCDIR /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

# Run unprivileged out of /relaysrv
RUN mkdir /relaysrv && chown nobody:nobody /relaysrv
USER nobody
WORKDIR /relaysrv

EXPOSE 22067 22070

CMD ["/usr/bin/strelaysrv"]
