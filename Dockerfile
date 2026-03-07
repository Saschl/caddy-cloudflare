FROM caddy:2.11.2-builder AS builder
RUN xcaddy build  --with github.com/caddyserver/cache-handler --with github.com/caddy-dns/cloudflare --with github.com/caddyserver/transform-encoder     --with github.com/hslatman/caddy-crowdsec-bouncer/http@main  --with github.com/mholt/caddy-l4  --with github.com/hslatman/caddy-crowdsec-bouncer/layer4@main --with github.com/protomaps/go-pmtiles/caddy
 
FROM caddy:2.11.2
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
