FROM caddy:2.6.4-builder-alpine AS builder

ENV GOPROXY=https://proxy.golang.org
RUN xcaddy build \
	--with git.nickzana.dev/nick/caddy-tailscale \
	--with github.com/mholt/caddy-l4

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
