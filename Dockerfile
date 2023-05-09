FROM caddy:2.6.4-builder-alpine AS builder

COPY caddy-tailscale/ caddy-tailscale/

ENV GOPROXY=https://proxy.golang.org
RUN xcaddy build \
	--with git.nickzana.dev/nick/caddy-tailscale=./caddy-tailscale

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
