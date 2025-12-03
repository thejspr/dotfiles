#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OFFICIAL_FILE="$SCRIPT_DIR/packages-official.txt"
AUR_FILE="$SCRIPT_DIR/packages-aur.txt"

FILTER_REGEX='^(linux|linux-headers|linux-cachyos|linux-firmware|base|base-devel|mkinitcpio|grub|efibootmgr|systemd)'

usage() {
    echo "Usage: $(basename "$0") [install|update]"
    echo "  install  - Install packages from package lists"
    echo "  update   - Update package lists from currently installed packages"
    exit 1
}

install_packages() {
    echo "Installing official packages..."
    sudo pacman -S --needed - < "$OFFICIAL_FILE"

    echo "Installing AUR packages..."
    paru -S --needed - < "$AUR_FILE"
}

update_packages() {
    echo "Updating package lists..."
    pacman -Qqen | grep -v -E "$FILTER_REGEX" | sort > "$OFFICIAL_FILE"
    pacman -Qqem | grep -v -E "$FILTER_REGEX" | sort > "$AUR_FILE"

    echo "Official packages: $(wc -l < "$OFFICIAL_FILE")"
    echo "AUR packages: $(wc -l < "$AUR_FILE")"
}

case "${1:-}" in
    install)
        install_packages
        ;;
    update)
        update_packages
        ;;
    *)
        usage
        ;;
esac
