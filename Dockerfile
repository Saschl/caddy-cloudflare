FROM caddy:2.11.2-builder AS builder
RUN xcaddy build   --with github.com/caddy-dns/cloudflare@a8737d095ad5a48ca031cea6ab704057dbc2d250 \
                   --with github.com/hslatman/caddy-crowdsec-bouncer/http@90a583cf5e6a91dd75a473f40e41f23e13981be5 \
                   --with github.com/mholt/caddy-l4@45c14772474b8477b4d03a3e899a8a7a580c3c93  \
                   --with github.com/hslatman/caddy-crowdsec-bouncer/layer4@90a583cf5e6a91dd75a473f40e41f23e13981be5 \
                   --with github.com/protomaps/go-pmtiles/caddy@b85498026ba0afb96c8b01f87d45624791a4f5b4
 
FROM caddy:2.11.2
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
