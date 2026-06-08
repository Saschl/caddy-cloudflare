FROM caddy:2.11.4-builder AS builder
RUN xcaddy build   --with github.com/caddy-dns/cloudflare@a8737d095ad5a48ca031cea6ab704057dbc2d250 \
                   --with github.com/hslatman/caddy-crowdsec-bouncer/http@c30397c7679203a8d49da723f4acb981fe68ca1b \
                   --with github.com/mholt/caddy-l4@45e9c728448b3109dff3e342321a3ad3eda5de64  \
                   --with github.com/hslatman/caddy-crowdsec-bouncer/layer4@c30397c7679203a8d49da723f4acb981fe68ca1b \
                   --with github.com/protomaps/go-pmtiles/caddy@b50d7b1acd72c02bf428e78f0f5c9dab020b6174
 
FROM caddy:2.11.4
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
