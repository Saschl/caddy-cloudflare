FROM caddy:2.11.9-builder AS builder

# Track versions for Renovate, but build from immutable commits.
# renovate: depName=caddy-dns/cloudflare version=v0.2.4
ARG CLOUDFLARE_COMMIT=a8737d095ad5a48ca031cea6ab704057dbc2d250
# renovate: depName=hslatman/caddy-crowdsec-bouncer version=v0.15.0
ARG CROWDSEC_COMMIT=4a6ce1d3094dbfd270fecf2a91aaab81663d0cb4
# renovate: depName=mholt/caddy-l4 version=v0.1.3
ARG CADDY_L4_COMMIT=eafc300ef23bcb2a28cc329a18e1e98bcd2b7cee
# renovate: depName=protomaps/go-pmtiles version=v1.31.2
ARG PMTILES_COMMIT=a3e4951ea6a0477b784c27c1dcbfd9c130878c5a

RUN xcaddy build   --with github.com/caddy-dns/cloudflare@${CLOUDFLARE_COMMIT} \
                   --with github.com/hslatman/caddy-crowdsec-bouncer/http@${CROWDSEC_COMMIT} \
                   --with github.com/mholt/caddy-l4@${CADDY_L4_COMMIT} \
                   --with github.com/hslatman/caddy-crowdsec-bouncer/layer4@${CROWDSEC_COMMIT} \
                   --with github.com/hslatman/caddy-crowdsec-bouncer/appsec@${CROWDSEC_COMMIT} \
                   --with github.com/protomaps/go-pmtiles/caddy@${PMTILES_COMMIT}
 
FROM caddy:2.11.9
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
