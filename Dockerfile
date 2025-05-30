FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-webdav \
    --with github.com/porech/caddy-maxmind-geolocation

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
