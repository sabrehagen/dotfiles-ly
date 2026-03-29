#!/bin/sh
# Sets up /etc/ly symlinks pointing to ~/.config/ly
# Run as root: sudo ~/.config/ly/bootstrap.sh

set -e

CONFIG_DIR="$HOME/.config/ly"
ETC_DIR="/etc/ly"

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: must be run as root (sudo $0)" >&2
    exit 1
fi

# Top-level files
ln -sf "$CONFIG_DIR/config.ini" "$ETC_DIR/config.ini"

# custom-sessions entries
ln -sf "$CONFIG_DIR/custom-sessions/desktop-environment.desktop" \
    "$ETC_DIR/custom-sessions/desktop-environment.desktop"
ln -sf "$CONFIG_DIR/custom-sessions/desktop-environment-login.sh" \
    "$ETC_DIR/custom-sessions/desktop-environment-login.sh"

# lang entries
ln -sf "$CONFIG_DIR/lang/en.ini" "$ETC_DIR/lang/en.ini"

echo "Symlinks set up in $ETC_DIR"
