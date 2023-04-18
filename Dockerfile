FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \ 
   # --with github.com/lucaslorentz/caddy-docker-proxy/plugin/v2 \
    --with github.com/caddyserver/caddy/v2=github.com/caddyserver/caddy/v2@v2.6.4


FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
