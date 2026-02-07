#!/bin/bash
set -euo pipefail

# Run desktop installers
for installer in ./scripts/desktop/*.sh; do source "$installer"; done
