#!/bin/sh
set -e

# If no config exists in the persistent volume yet, create a default one.
if [ ! -f /etc/unbound/unbound.conf ]; then
  cat > /etc/unbound/unbound.conf <<'EOF'
server:
  interface: 0.0.0.0
  port: 5335
  do-ip4: yes
  do-ip6: no
  do-udp: yes
  do-tcp: yes
  root-hints: "/etc/unbound/root.hints"
  hide-identity: yes
  hide-version: yes
  qname-minimisation: yes
  prefetch: yes
EOF
fi

unbound-checkconf /etc/unbound/unbound.conf
exec unbound -d -c /etc/unbound/unbound.conf
