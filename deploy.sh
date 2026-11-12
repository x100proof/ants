#!/usr/bin/env bash
# Copy the game into a web server's document root. There's no build step: the game
# is one self-contained HTML file. The build time is stamped into the copy so
# debug logs say which version produced them.
#
#   ./deploy.sh /var/www/ants
#   ANTS_DEST=/srv/www/ants ./deploy.sh
set -euo pipefail
SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="${1:-${ANTS_DEST:-}}"
if [ -z "$DEST" ]; then
  echo "usage: $0 <docroot>   (or set ANTS_DEST)" >&2
  exit 1
fi
mkdir -p "$DEST"
install -m 0644 "$SRC/index.html" "$DEST/index.html"
sed -i "s/__BUILD__/$(date -u +%Y%m%dT%H%M%SZ)/g" "$DEST/index.html"
echo "deployed to $DEST"
