#!/bin/bash
set -euo pipefail

curl -fsSL -o /tmp/inklecate.zip "https://github.com/inkle/ink/releases/latest/download/inklecate_linux.zip"
[ -s /tmp/inklecate.zip ] || { echo "Inklecate download failed"; exit 1; }
rm -rf /tmp/inklecate
unzip -oq /tmp/inklecate.zip -d /tmp/inklecate
mkdir -p "$HOME/apps"
rm -rf "$HOME/apps/inklecate"
mv "/tmp/inklecate" "$HOME/apps/inklecate"
rm -f /tmp/inklecate.zip
mkdir -p "$HOME/.local/bin"
ln -sfn "$HOME/apps/inklecate/inklecate" "$HOME/.local/bin/inklecate"

# Inklecate java
APP_VERSION="$(
  curl -fsSL "https://api.github.com/repos/bladecoder/blade-ink-java/releases/latest" \
    | grep -Po '"tag_name": "v\K[^"]*' \
    || true
)"
[ -n "$APP_VERSION" ] || { echo "Unable to resolve Java Inklecate version"; exit 1; }
curl -fsSL -o "$HOME/apps/inklecate-${APP_VERSION}.jar" "https://github.com/bladecoder/blade-ink-java/releases/download/v${APP_VERSION}/inklecate-${APP_VERSION}.jar"

# Create script to run inklecate java in $HOME/.local/bin
cat > "$HOME/.local/bin/jinklecate" <<EOF
#!/bin/bash
java -jar "$HOME/apps/inklecate-${APP_VERSION}.jar" "\$@"
EOF

chmod +x "$HOME/.local/bin/jinklecate"
