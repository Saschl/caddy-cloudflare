FROM caddy:2.11.7-builder AS builder
RUN xcaddy build   --with github.com/caddy-dns/cloudflare@v0.2.4 \
                   --with github.com/hslatman/caddy-crowdsec-bouncer/http@v0.14.1 \
                   --with github.com/mholt/caddy-l4@v0.1.2  \
                   --with github.com/hslatman/caddy-crowdsec-bouncer/layer4@v0.14.1 \
                   --with github.com/hslatman/caddy-crowdsec-bouncer/appsec@v0.14.1 \
                   --with github.com/protomaps/go-pmtiles/caddy@v1.31.2
 
FROM caddy:2.11.7
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
