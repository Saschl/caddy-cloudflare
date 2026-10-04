FROM caddy:2.11.6-builder AS builder
RUN xcaddy build   --with github.com/caddy-dns/cloudflare@a8737d095ad5a48ca031cea6ab704057dbc2d250 \
                   --with github.com/hslatman/caddy-crowdsec-bouncer/http@ffdcb7c6f8619effc7510bc0db0edec3609a1d28 \
                   --with github.com/mholt/caddy-l4@42db5690dea199f930a6f08005fe2e4aab10dcc9  \
                   --with github.com/hslatman/caddy-crowdsec-bouncer/layer4@ffdcb7c6f8619effc7510bc0db0edec3609a1d28 \
                   --with github.com/protomaps/go-pmtiles/caddy@a3e4951ea6a0477b784c27c1dcbfd9c130878c5a
 
FROM caddy:2.11.6
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
