FROM joseluisq/static-web-server:2-alpine AS sws

FROM scratch
COPY --from=sws /usr/local/bin/static-web-server /static-web-server
COPY public/ /public/

ENV SERVER_PORT=3000 \
    SERVER_ROOT=/public \
    SERVER_HEALTH=true \
    SERVER_CACHE_CONTROL_HEADERS=true \
    SERVER_LOG_LEVEL=warn

EXPOSE 3000
USER 65534:65534
ENTRYPOINT ["/static-web-server"]