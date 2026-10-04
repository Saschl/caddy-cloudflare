FROM caddy:2.11.4-builder AS builder
RUN xcaddy build   --with github.com/caddy-dns/cloudflare@a8737d095ad5a48ca031cea6ab704057dbc2d250 \
                   --with github.com/hslatman/caddy-crowdsec-bouncer/http@ffdcb7c6f8619effc7510bc0db0edec3609a1d28 \
                   --with github.com/mholt/caddy-l4@45e9c728448b3109dff3e342321a3ad3eda5de64  \
                   --with github.com/hslatman/caddy-crowdsec-bouncer/layer4@ffdcb7c6f8619effc7510bc0db0edec3609a1d28 \
                   --with github.com/protomaps/go-pmtiles/caddy@b50d7b1acd72c02bf428e78f0f5c9dab020b6174
 
FROM caddy:2.11.4
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
