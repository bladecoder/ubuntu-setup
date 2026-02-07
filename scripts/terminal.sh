#!/bin/bash
set -euo pipefail

# Run terminal installers
for installer in ./scripts/terminal/*.sh; do source "$installer"; done
