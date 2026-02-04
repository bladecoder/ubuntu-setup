#!/bin/bash

curl -sLo /tmp/inklecate.zip "https://github.com/inkle/ink/releases/latest/download/inklecate_linux.zip"
unzip -q /tmp/inklecate.zip -d /tmp/inklecate
mv /tmp/inklecate $HOME/apps
rm -f /tmp/inklecate.zip
ln -s $HOME/apps/inklecate/inklecate $HOME/.local/bin/inklecate

# Inklecate java
APP_VERSION=$(curl -s "https://api.github.com/repos/bladecoder/blade-ink-java/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -sLo $HOME/apps/inklecate-${APP_VERSION}.jar "https://github.com/bladecoder/blade-ink-java/releases/download/v${APP_VERSION}/inklecate-${APP_VERSION}.jar"

# Create script to run inklecate java in $HOME/.local/bin
cat > $HOME/.local/bin/jinklecate <<EOF
#!/bin/bash
java -jar $HOME/apps/inklecate-${APP_VERSION}.jar "\$@"
EOF

chmod +x $HOME/.local/bin/jinklecate

