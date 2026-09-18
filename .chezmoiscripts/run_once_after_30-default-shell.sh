#!/bin/bash
set -eufo pipefail

FISH="$(command -v fish)"

if ! grep -qxF "$FISH" /etc/shells; then
    echo "$FISH" | sudo tee -a /etc/shells >/dev/null
fi

if [ "$SHELL" != "$FISH" ]; then
    chsh -s "$FISH"
fi
